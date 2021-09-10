# Protected-Mode Memory Management
Vol 3, Chapter 3

## Logical and Linear Addresses
Vol 3, 3.4

In protected mode 2 address translation modes to get to phys address:
- logical-address translation
- linear address space paging

**logical address**: 16-bit segment selector + 32-bit offset
*Segment selector identifies the segment the byte is located in and the offset specifies the location
of the byte in the segment relative to the base address of the segment.*

In 64-bit mode segmentation is generally disabled. The processor treats CS, DS, ES, SS as zero,
creating a linear address that is equal to the effective address.
But not completely. FS and GS is still used
for linear addr calculations. They facilitate addressing local data and certain OS data structures.

Usually FS, GS denotes a distinct Linear Address Space that can be used for thread local storage
for example. They point to some OS data structure. 

### windbg segment descriptor inspection
https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/dg--display-selector-
```
dg fs
```

## Segment Selectors
Vol 3, 3.4.2

Used to select a different data structure from either:
- *GDT - Global Descriptor Table*
- *LDT - Local Descriptor Table*

GDT and LDT are tables of data structures where the members
describe segments (chunks of memory).

**segment selector**: 16-bit identifier for a segment.
It does not point directly to the segment, but instead points to the
**segment descriptor** that defines the segment.
A segment selector contains the following items:
- *Index*: Bits 3-15. Selects one of the 8192 descriptors in the GDT or LDT. The processor multiplies
the index value by 8 (the number of bytes in a segment descriptor) and adds the result to the base
address of the GDT or LDT (from the GDTR or LDTR register, respectively).
Index is 13 bits, so can address 8192 slots in GDT or LDT.
- *TI (Table indicator) flag*: Bit 2. Specifies the descriptor table to use. 
Clearing this flag selects the GDT; setting this flag selects the current LDT.
- *Requested Privilige Level (RPL)*: Bits 0 and 1. Privilige level of the selector.
Can range from 0 to 3, 0 being the most priviliged.

## Segment Registers

Segment registers hold the segment selectors. We have 6 segment registers that can hold
the selectors.
Segments are available by loading the segment selectors (segment identifiers) into segment registers.
Program can change the selected segments by loading different segment selectors into registers.

You load a segment **selector** (which is just a number) into a **register** which
then points to a segment **descriptor**.
"A segment selector is a 16-bit identifier for a segment. It does not point directly to the segment,
but instead points to the segment descriptor that defines the segment."

### Visible + Hidden part

Every segment *register* has a 
    - *visible* (selector) and a
    - *hidden* part (also called *descriptor cache* or *shadow register*)
        - base + limit + access

## Segment descriptors

Selectors (which is stored in the register) point to them.

A segment descriptor is a data structure in a GDT or LDT that provides the processor with 
the size and location of a segment, as well as access control and status information.

8192 descriptors in the GDT or LDT.

(windbg) The `dg` command shows the segment descriptor for the specified selector.


# GDT, LDT
Vol 3, 2.1.1

**GDT** : **Global Descriptor Table**
**LDT** : **Local Descriptor Table**
In protected mode all memory accesses pass through either the GDT or optionally the LDT.
These tables *contain entries*, called *segment descriptors*.
*segment descriptor*: base address of segment + access rights, type, usage information.
Segment selector provides the index into the GDT/LDT to get at the seg descriptor for the segment.
From the segment descriptor the CPU gets the base address of the segment in the linear address space.
The offset then provides the location of the byte relative to the base address.

**GDTR** register holds the address to the **GDT**.
**LDTR** register holds the address to the **LDT**.

## GDTR
Vol 3, 2.4.1

The GDTR register holds the base address (32 bits in protected mode; 64 bits in IA-32e mode) 
and the 16-bit table limit for the GDT. The base address specifies the linear address of byte 0 of the GDT; 
the table limit specifies the number of bytes in the table.

The *LGDT* and *SGDT* instructions load and store the GDTR register.

*LGDT* - load into the GDT from memory - priviliged
*SGDT* - store into memory from GDT - not priviliged

## LDTR

16-bit segment selector + base address(64 bits in IA-32e mode) + segment limit + descriptor attributes
for the LDT.
base address specifies the linear address o byte 0 of hte LDT segment; limit specifies the number of
bytes in the segment.

The *LLDT* and *SLDT* instructions load and store the LDTR register.

# Segment Descriptor Tables (Vol 3, 3.5.1)


