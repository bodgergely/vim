Object Manager
==============

Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/windows-kernel-mode-object-manager

Object model to provide secure access to the various internal services implemented in the executive.

objects -> internal services

object manager -> creates, deletes, tracks, protects the *objects*.

Centralizes resource control operations. (This way they are not scattered throughout the system)

Use *WinObj* from Sysinternals to display:
    - object's manager internal namespace
    - information about objects
        - reference counts
        - number of open handles
        - securit descriptors
Use *Process Explorer* from Sysinternals to display:
    - open handles for a process

Use *Openfiles /query* command

Use !handle in WinDbg(or KD)

Always Preemptible and Always Interruptible
===========================================

- ISR: Interrupt Service Routine
- IRQL: Interrupt Request Level
- interrupt vector: table entry where ISRs are installed by the OS
- hardware priority: IRQL where the driver operates

ISR can be interrupted by a higher IRQL ISR.

The goal of the preemptible, interruptible design of the operating system is to maximize system performance. Any thread can be preempted by a thread with a higher priority, and any driver's interrupt service routine (ISR) can be interrupted by a routine that runs at a higher interrupt request level (IRQL).

Kernel-mode code is always *interruptible*. ISR masks out the equal or lesser IRQLs ISRs so those won't interrupt it, only
higher level ISRs.

IRQ_LEVELS:
PASSIVE_LEVEL   - threads usually run at this level (no interrupts are masked out)
APC_LEVEL -
DISPATCH_LEVEL -

Any driver's interrupt service routine (ISR) can be interrupted by another routine (for example, by another driver's ISR) that runs at a higher IRQL.
Because of this, the ISR usually queues a DPC (deferred procedure call) and quickly exits. (Similar to Linux with bottom halves/tasklets)
Later this queued DPC is dequeued and ran, so the driver can complete its I/O operation at a *lower IRQL*!!

Good performance rule: Finish high IRQL work very quickly!

Driver routines and thread context:
-----------------------------------
Only a highest-level driver is called in the context of the thread that is requesting the driver's current I/O operation.
Driver routines usually execute in an **arbitrary thread context** —the context of whatever thread is current when a standard driver routine is called. For performance reasons (to avoid context switches), very few drivers set up their own threads.



Types of Windows Drivers
========================
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/types-of-windows-drivers

- User-mode driver:
    Interfacing Win32 app <---> Kernel-mode driver (or other OS components)
- Kernel-mode driver:
    Executing in kernel mode as part of the executive
    Layered architecture: Higher level driver receives data from app, filters it and passes it down to lower layers.
    They can be WDM drivers.

Kernel-mode drivers are constructed out of system defined *Standard Driver Routines*.


Standard Driver Routines
------------------------
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-standard-driver-routines


I/O request packets (IRP) are processed by the driver by using these routines.
To process these IRPs the basic set of routines need to be implemented by the driver and can implement
optional routines too. Lower level drivers usually need to implement the most, while high level
drivers usually pass the IRPs down the chain to lower level drivers.

Required:
    - DriverEntry:       Initializes the driver and its driver object
    - AddDevice:         Initializes devices and creates device objects
    - Unload:            Release system resources acquired by the driver
    - Dispatch Routines: Receive and process IRPs
        - DispatchCreate
        - DispatchClose
        - DispatchCreateClose

Optional:
    - StartIo:          Start I/O operation on a physical device.
    - IoCompletion

Current IRP + target device object are the input parameters to these routines.
Driver processes the IRPs in stages through its standard routines.



Driver Objects
--------------
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-driver-objects

I/O manager -> creates driver object for each driver that has been loaded
DRIVER_OBJECT struct

IRP processing mechanis:
I/O manager calls DriverEntry and also supplies the address of the driver's driver object. Driver object (DRIVER_OBJECT)
contains the slots for the routines that need to be filled out by the driver.
Once the slots are filled, the driver is initialized and the I/O manager is ready to call its routines
where it supplies as params the IRP + target device object.

DriverObject:
---------------------
PtrDeviceObject     |
PtrDriverExtensio   |
.                   |
.                   |
DriverEntry         |
DDDispatchXxx       |
.                   |
.                   |
DDDispatchYyy       |
DDStartio           |
DDUnload            |
--------------------|



Windows Driver Model (WDM)
--------------------------
Link: https://docs.microsoft.com/en-us/windows-hardware/drivers/kernel/introduction-to-wdm
