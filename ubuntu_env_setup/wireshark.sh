sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod o-rx /usr/bin/dumpcap
sudo setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap
sudo usermod -a -G wireshark $USER
