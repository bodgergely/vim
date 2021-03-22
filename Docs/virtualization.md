**Paravirtualized OS**: is aware that it is running inside a virtual machine, and so
makes hypercalls directly, rather than issuing priviliged instructions.

Xen Project
===========

Xen Project is a development community with several subprojects:
- Hypervisor
- PV Drivers
- Unikernel related projects:
    - MirageOS, Unikraft

Xen
============

Type-1 hypervisor.
Xen is virtual machine monitor, also knows as a hypervisor that manages
virtual machines or domains.

The Xen Project hypervisor runs directly on the hardware and is responsible for handling CPU, Memory, timers and interrupts.
It is the first program running after exiting the bootloader.

The Xen host is referred to as dom0 and the guests are knows as domUs (unprivileged domain).

dom0 is the host and domUs are managed by the dom0.

Two types of virtualization is supported:
- Para virtualized guests
The guest OS is aware that it is virtualized and needs OS level support.
Guest OS kernel and drivers are modified and are aware that it's being virtualized
and runnig inside a vitual machine.
No hardware support is required.

- Fully virtualized guest:
Hardware assisted requiring virtualization extensions, ie AMD-V or Intel VT
Guest OS does not need to be aware.

Xen emulates the hardware. So it is slower.


Architecure
-----------
VM0 or Dom0     |   VM1 (DomU1)   |  VM2 (DomU2)

Dom0 Kernel         Applications      Applications
Native Driver       Guest OS          Guest OS

Xen(Scheduler - MMU - Timers - Interrupts)
Host(I/O - Memory - CPUs)

VM0 or Dom0 provides System Services (XS, DE, TS) and interracts with the hypervisor.
Provides hardware support for a Xen system with native and virtual drivers.

xl is the toolstack for Xen. Use to create/pause/shutdown/list domains
enable or pin VCPUs and attach virtual block devices.

/etc/xen/<domain>.cfg - describe the domain

Hypercalls
--------------------------------

Link: https://wiki.xenproject.org/wiki/Hypercall#:~:text=A%20hypercall%20is%20a%20software,privileged%20operations%20like%20updating%20pagetables.

Example: http://xenbits.xen.org/docs/unstable/hypercall/x86_64/include,public,xen.h.html#Func_HYPERVISOR_mmu_update
HYPERVISOR_mmu_update() function to update mmu.

A hypercall is to a syscall what a hypervisor is to an OS. Alternatively, a hypercall is to a hypervisor what a syscall is to a kernel. A hypercall is a software trap from a domain to the hypervisor, just as a syscall is a software trap from an application to the kernel. Domains will use hypercalls to request privileged operations like updating pagetables. Like a syscall, the hypercall is synchronous, but the return path from the hypervisor to the domain uses event channels. An event channel is a queue of asynchronous notifications, and notify of the same sorts of events that interrupts notify on native hardware. When a domain with pending events in its queue is scheduled, the OS's event-callback handler is called to take appropriate action.

See xen/include/public/xen.h in the Xen sources and the Xen hypercall interface documentation



