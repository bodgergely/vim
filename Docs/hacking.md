## Enumeration - Recon

Start with nmap always:
### nmap
```bash
sudo nmap -sC -sV -oA nmap/<folder> <IP>
```

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
# vhost signals virtual host - if think there is more host
gobuster vhost
```

