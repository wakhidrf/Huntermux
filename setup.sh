#! /bin/bash

clear
echo "================================================="
echo "Installing Base"
echo "================================================="

pkg upgrade -y && pkg update && pkg install tur-repo wget rust ruby perl golang nodejs php python -y

clear
echo "================================================="
echo "Installing Fix"
echo "================================================="

pkg upgrade -y && pkg update && pkg install perl-net-ssleay python-lxml -y

cd
wget https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329/pycares-4.3.0.tar.gz
tar -xf pycares-4.3.0.tar.gz
sed -i s/'#define HAVE_GETSERVBYPORT_R 1'//g ./pycares-4.3.0/deps/build-config/config_android/ares_config.h
pip install ./pycares-4.3.0

clear
echo "=================================================="
echo "Installing Repo Tools"
echo "Nmap THC-hydra"
echo "=================================================="

pkg upgrade -y && pkg update && pkg install nmap thc-hydra -y

cd
git clone https://github.com/scipag/vulscan.git
cd ../usr/share/nmap/scripts/
ln -s /data/data/com.termux/files/home/vulscan/

clear
echo "=================================================="
echo "Installing Community Tools"
echo "Metasploit Ngrok Aircrack-NG JohnTheRipper"
echo "=================================================="

cd
source <(curl -fsSL https://kutt.it/msf)

cd
cd Huntermux/assets/
tar -xvzf ngrok-v3-stable-linux-arm64.tgz -C /data/data/com.termux/files/usr/bin

cd
cd Huntermux/assets/aircrack-ng/
bash setup.sh

cd
cd Huntermux/assets/
cp jtr-installer.sh ../../jtr-installer.sh
cd
bash jtr-installer.sh
rm -rf jtr-installer.sh

clear
echo "=================================================="
echo "Installing Python Tools"
echo "theHarvester Anubis-Netsec sqlMap"
echo "=================================================="

cd
git clone https://github.com/laramies/theHarvester.git
cd theHarvester/
python3 -m pip install -r requirements/base.txt
cd
ln -s /data/data/com.termux/files/home/theHarvester/theHarvester.py

cd
pip install anubis-netsec
cd ../usr/lib/python3.11/site-packages/dns/
rm -rf resolver.py
cp /data/data/com.termux/files/home/Huntermux/assets/resolver.py resolver.py

cd
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
ln -s /data/data/com.termux/files/home/sqlmap-dev/sqlmap.py

clear
echo "=================================================="
echo "Installing Perl Tools"
echo "Nikto"
echo "=================================================="

cd
git clone https://github.com/sullo/nikto.git
cd
ln -s /data/data/com.termux/files/home/nikto/program/nikto.pl
cd Huntermux/assets/
cp nikto.conf.default ../../nikto/program/nikto.conf.default

clear
echo "=================================================="
echo "Installing Ruby Tools"
echo "BeEF"
echo "=================================================="

cd
git clone https://github.com/beefproject/beef.git
cd beef/
bundle install

clear
echo "================================================="
echo "Installing Golang Tools"
echo "Nuclei Mosint SmuggleFuzz"
echo "================================================="

cd
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install -v github.com/alpkeskin/mosint/v3/cmd/mosint@latest
go install github.com/moopinger/smugglefuzz@latest
cd ../usr/bin/
ln -s /data/data/com.termux/files/home/go/bin/nuclei
ln -s /data/data/com.termux/files/home/ho/bin/mosint
ln -s /data/data/com.termux/files/home/ho/bin/smugglefuzz
cd
cd Huntermux/assets/
cp .mosint.yaml /data/data/com.termux/files/home/.mosint.yaml

clear
echo "=================================================="
echo "Installing Nodejs Tools"
echo "RetireJS"
echo "=================================================="

cd
npm install -g retire
retire

clear
echo "=================================================="
echo "OneScriptSetup Complete"
echo "=================================================="
