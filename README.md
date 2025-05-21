# Huntermux
This repo contains some guide to install some useful tool for pentester on termux, tested on my android 14 aarch64 device non-rooted.
## Full Install
Make sure you have more than 7GB free space, then do
```
cd
git clone https://github.com/wakhidrf/Huntermux.git
cd Huntermux
bash setup.sh
```
## Repo Tools
You need termux user repository repo, do
```
pkg update && pkg install tur-repo -y
```
### Nmap
Run this
```
pkg update && pkg install nmap -y
```
> Adding vulscan.nse script
```
cd
git clone https://github.com/scipag/vulscan.git
cd ../usr/share/nmap/scripts/
ln -s /data/data/com.termux/files/home/vulscan/
```
### THC-Hydra
Run this
```
pkg update && pkg install thc-hydra -y
```
## Community Tools
### Metasploit
[guzhmazuko](https://github.com/gushmazuko/metasploit_in_termux) made an easy installation of metasplot on termux, do
```
bash
source <(curl -fsSL https://kutt.it/msf)
```
### Aircrack-NG
Run this
```
cd
git clone https://github.com/wakhidrf/Huntermux.git
cd Huntermux/assets/aircrack-ng/
bash setup.sh
```
### Ngrok
To install ngrok, you need to sign up at [ngrok]( https://ngrok.com/), then run this
```
cd
git clone https://github.com/wakhidrf/Huntermux.git
cd Huntermux/assets/
tar -xvzf ngrok-v3-stable-linux-arm64.tgz -C /data/data/com.termux/files/usr/bin
```
Then use your token
```
ngrok config add-authtoken <Your Token>
```
### John The Ripper
Run this
```
cd
cd Huntermux/assets/
cp jtr-installer.sh ../../jtr-installer.sh
cd
bash jtr-installer.sh
rm -rf jtr-installer.sh
```
## Python Tools
You need python, do
```
pkg update && pkg install python -y
```
### theHarvester
Clone this repo
```
git clone https://github.com/laramies/theHarvester.git
```
Fix lxml, do
```
pkg update && pkg install python-lxml -y
```
Fix pycares, do
```
wget https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329/pycares-4.3.0.tar.gz
tar -xf pycares-4.3.0.tar.gz
sed -i s/'#define HAVE_GETSERVBYPORT_R 1'//g ./pycares-4.3.0/deps/build-config/config_android/ares_config.h
pip install ./pycares-4.3.0
```
Inside theHarvester folder, do
```
python3 -m pip install -r requirements/base.txt
```
Make shortcut on home directory, do
```
cd
ln -s /data/data/com.termux/files/home/theHarvester/theHarvester.py
```
To run theHarvester, do
```
python3 theharvester.py -h
```
To set API, follow [laramies](https://github.com/laramies/theHarvester/wiki/Installation#api-keys) guide
### Anubis-Netsec
Run this
```
cd
pip install anubis-netsec
git clone https://github.com/wakhidrf/Huntermux.git
cd ../usr/lib/python3.11/site-packages/dns/
rm -rf resolver.py
cp /data/data/com.termux/files/home/Huntermux/assets/resolver.py resolver.py
```
### sqlMap
Run This
```
cd
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
ln -s /data/data/com.termux/files/home/sqlmap-dev/sqlmap.py
```

## Perl Tools
You need perl, do
```
pkg update && pkg install perl -y
```
### Nikto
Clone this repo
```
git clone https://github.com/sullo/nikto.git
```
Make shortcut on home directory, do
```
cd
ln -s /data/data/com.termux/files/home/nikto/program/nikto.pl
```
To run nikto, do
```
perl nikto.pl -h
```
> Adding ssl support
```
cd
git clone https://github.com/wakhidrf/Huntermux.git
cd Huntermux/assets/
cp nikto.conf.default ../../nikto/program/nikto.conf.default
```
## Ruby Tools
You need ruby, do
```
pkg update && pkg install ruby -y
```
### BeEF
Clone this repo
```
git clone https://github.com/beefproject/beef.git
```
Inside beef folder, do
```
bundle install
```
To run BeEF, do
```
bash ./beef
```
## Golang Tools
You need golang, do
```
pkg update && pkg install golang -y
```
### Nuclei
Run this
```
cd
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/go/bin/nuclei
```
### Mosint
Run this
```
cd
go install -v github.com/alpkeskin/mosint/v3/cmd/mosint@latest
git clone https://github.com/wakhidrf/Huntermux.git
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/ho/bin/mosint
cd
cd Huntermux/assets/
cp .mosint.yaml /data/data/com.termux/files/home/.mosint.yaml
```
To set API, follow [alpkeskin](https://github.com/alpkeskin/mosint) guide
### SmuggleFuzz
Run this
```
cd
go install github.com/moopinger/smugglefuzz@latest
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/ho/bin/smugglefuzz
```
## Nodejs Tools
You need nodejs, do
```
pkg update && pkg install nodejs -y
```
### RetireJS
Run this
```
cd
npm install -g retire
retire
```
