# Process Injection

## General Concept

1. Get a Handle on the target process
2. Mechanism to transfer payload to target process
3. Injected code/payload should be possible to be executed

### Acquire Process Handle for target process

- might be obtained by creating a new process
    many packers inject into their own child process
- CreateProcess API and its variants
    (CreateProcessWithLogonW, CreateProcessAsUser, NtCreateUserProcess)
- Search for already running processes
    (Process32First,Process32Next to iterate the processes)
    (NtQuerySystemInformation to obtain process listing)
- OpenProcess() - to return the Handle to the process


### Prepare for injection

- Suspend process?

- Inject:
    - Section only
    - Whole process image
    - code pieces
    - dlls

### Transfer data to target process


#### Section
Combination of the below:
- NtUnmapViewOfSection
- NtCreateSection
- NtMapViewOfSection

This is the Unmap+Rewrite execution technique.
Unmapping means that the virtual address space for this section is no longer
reserved and can be used for something else.
CreateSection will contain the data.

#### Process
- NtUnmapViewOfSection
- VirtualAllocEx
- WriteProcessMemory

#### Code
- VirtualAllocEx
- WriteProcessMemory

### Execute newly injected data

- SetThreadContext()
- ResumeThread() - since the thread was suspended
- CreateRemoteThread()
- QueueUserAPC()

## Atombombing

Original research:
https://github.com/BreakingMalwareResearch/atom-bombing

https://www.enisa.europa.eu/publications/info-notes/atombombing-2013-a-new-code-injection-attack

Atom tables: Share data between processes.

* We add the malicious code as a string to the Atom table via GlobalAddAtom().  
* Issue an APC for GlobalGetAtomName to make an alertable thread in the target process
* Copy the code to its own memory (region needs to have RWX rights)

QueueUserAPC()


## Typical functions for injection of code

VirtualProtectEx
VirtualAllocEx
NtMapViewOfSection
NtCreateUserProcess

## Techniques

- Process Hollowing (old school)
- Atombombing via Atom tables
- Process Doppelganging with transactional api of NTFS

## Process Doppelganging

https://hshrzd.wordpress.com/2017/12/18/process-doppelganging-a-new-way-to-impersonate-a-process

Starts before the process is even created.
We have some data to inject + we need some kind of data transfer mechanism,
but now into a file instead of the process memory, then process creation happens.


(backstory: Windows Vista introduced Transactional NTFS to perform safe atomic file
operations. Like in a database, commits etc.)

The injected data is a PE file section.

CreateTransaction + CreateFileTransacted.
RollbackTransaction() to revert changes


CreateTransaction + CreateFileTransacted() -> NtCreateProcess() -> RollbackTransaction()
The version of the file image is used to create the process. then the file operation is reverted.


## Process hollowing

https://www.youtube.com/watch?v=aBKk2KAN0E0&list=PLynb9SXC4yETfpdnY1w0S_Sgq05A-B_6I
https://countuponsecurity.com/2015/12/07/malware-analysis-dridex-process-hollowing/

Carve out a memory section in the hollowed process and load the malicious image there.
Bootstrap application uses CreateProcess with Destination Image (create process CREATE_SUSPENDED
because if CREATE_SUSPENDED you are able to modify its contents) to create the process then
NtUnmapViewOfSection + WriteProcessMemory to push the Source Image into the created process.
Once written, you call ResumeProcess().

## CreateRemoteThread + WriteProcessMemory

https://www.youtube.com/watch?v=W_rAxPm4TTU&list=PLynb9SXC4yETfpdnY1w0S_Sgq05A-B_6I&index=2


## Hook Injection

https://www.youtube.com/watch?v=oS54M2GMXNY&list=PLynb9SXC4yETfpdnY1w0S_Sgq05A-B_6I&index=3
https://www.codeproject.com/Articles/4610/Three-Ways-to-Inject-Your-Code-into-Another-Proces
https://www.elastic.co/blog/ten-process-injection-techniques-technical-survey-common-and-trending-process


## Process Injection Techniques - Gotta Catch Them All

https://www.youtube.com/watch?v=xewv122qxnk

# Resources on Internet

## Really good with examples (might be dated)
http://www.rohitab.com/discuss/topic/39535-code-injections-beginner-and-advanced/

