# Links
Good collection of resources
https://github.com/Wenzel/awesome-virtualization

Explains the basics
https://rayanfam.com/topics/hypervisor-from-scratch-part-1/
https://github.com/SinaKarvandi/Hypervisor-From-Scratch

Hypervisor (UEFI)
https://github.com/tandasat/MiniVisorPkg

Blackhat 2014 talk from Bromium dev on breaking hypervisors
https://www.youtube.com/watch?v=PJWJjb0uxXE

https://www.youtube.com/watch?v=fYH8A3RjPwY

Glitches in the Matrix
https://www.cpl0.com/blog/?p=46

you can escape out of many lightweight hypervisors by weaponizing the Interrupt Controller against the hypervisor. Many lightweight hypervisors choose to share the Interrupt Descriptor Table and Interrupt Controller with the guest.

**[Phrack Vol. 69: A hypervisor for rootkits](http://www.phrack.org/issues/69/15.html)**
http://www.phrack.org/issues/69/15.html

Blogs
https://howtohypervise.blogspot.com/
https://revers.engineering/

Minimalistic Hypervisors basedon Intel VT-X

https://github.com/DarthTon/HyperBone
https://github.com/tandasat/HyperPlatform
https://github.com/tandasat/MiniVisorPkg
https://github.com/wbenny/hvpp
https://github.com/ionescu007/SimpleVisor
https://github.com/Gbps/gbhv  - Simple x64 Hypervisor Framework
https://github.com/Bareflank/hypervisor

https://github.com/SinaKarvandi/Hypervisor-From-Scratch

## Spectre/Meltdown
https://msrc-blog.microsoft.com/2018/03/23/kva-shadow-mitigating-meltdown-on-windows/

Out of order processors are obligated to “roll back” the architecturally-visible effects of speculative execution down paths that are proven to have never been reachable during in-program-order execution, and as such, any µops that consume the result of a faulting load are ultimately cancelled and rolled back by the processor once the faulting load instruction retires. However, these dependent µops may still have issued subsequent cache loads based on the (faulting) privileged memory load, or otherwise may have left additional traces of their execution in the processor’s caches. This creates a speculative side channel: the remnants of cancelled, speculative µops that operated on the data returned by a load incurring a permission fault may be detectable through disturbances to the processor cache, and this may enable an attacker to infer the contents of privileged kernel memory that they would not otherwise have access to. In effect, this enables an unprivileged user mode process to disclose the contents of privileged kernel mode memory.

# VMX-Intel
The below is from Intel Software Manual Vol 3.

## VPIDS (Virtual Processor Identifiers)

The original architecture for VMX operation required VMX transitions to flush the TLBs and paging-structure caches.
This ensured that translations cached for the old linear-address space would not be used after the transition.

Virtual-processor identifiers (VPIDs) introduce to VMX operation a facility by which a logical processor may cache
information for multiple linear-address spaces. When VPIDs are used, VMX transitions may retain cached informa-
tion and the logical processor switches to a different linear-address space.

## EPT (extended page table)

The extended page-table mechanism (**EPT**) is a feature that can be used to support the virtualization of physical
memory. When EPT is in use, certain addresses that would normally be treated as physical addresses (and used to
access memory) are instead treated as **guest-physical addresses**. Guest-physical addresses are translated by
traversing a set of **EPT paging structures** to produce physical addresses that are used to access memory.

https://rayanfam.com/topics/hypervisor-from-scratch-part-4/ says:

"To reduce the complexity of Shadow Page Tables and avoiding the excessive vm-exits and reducing the number of TLB flushes, EPT, a hardware-assisted paging strategy implemented to increase the performance.
EPT implemented one more page table hierarchy, to map Guest-Virtual Address to Guest-Physical address which is valid in the main memory."

In EPT,

-   One page table is maintained by guest OS, which is used to generate the guest-physical address.
-   The other page table is maintained by VMM, which is used to map guest physical address to host physical address.

so for each memory access operation, EPT MMU directly gets the guest physical address from the guest page table and then gets the host physical address by the VMM mapping table automatically.


---

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



