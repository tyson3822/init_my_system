#!/bin/bash

# install_tools.sh
mkdir ${HOME}/packages

DATETIME=`date +%Y%m%d_%H%M%S`
OUTPUT_LOG=${HOME}/packages/install_tools_${DATETIME}.log

# For Ubuntu
#INSTALL_SVR_LIST=('linux-tools-common' 'wget' 'ntpdate' 'vim' 'nmon' 'htop' 'arp' 'taskset' 'telnet' 'valgrind' 'tmux' 'tree' 'net-tools' 'iperf' 'nc' 'nmap' 'libpcap-dev' 'fping' 'python3' 'tcpreplay' 'cifs-utils' 'tshark' 'wireshark' 'rename' 'smartmontools' 'mlocate' 'fontconfig' 'chrony' 'vsftpd' 'apache2' 'traceroute' 'lm-sensors' 'datamash' 'nfs-utils' 'mariadb' 'mysql-devel' 'mysql++' 'mysql++-devel' 'chromium-browser')
INSTALL_LIST=('linux-tools-common' 'linux-tools-5.4.0-131-generic' 'wget' 'ntpdate' 'vim' 'nmon' 'htop' 'arp' 'taskset' 'telnet' 'valgrind' 'tmux' 'tree' 'net-tools' 'iperf' 'nc' 'nmap' 'libpcap-dev' 'fping' 'python3' 'tcpreplay' 'cifs-utils' 'tshark' 'rename' 'smartmontools' 'mlocate' 'fontconfig' 'chrony' 'vsftpd' 'traceroute' 'lm-sensors' 'datamash' 'nfs-common' 'mysql-client' 'libmysqlclient-dev' 'libmysql++-dev' 'zip')

# Useless
#USELESS=('zlib-devel*' 'gmp-devel.x86_64' 'libmpc-devel.x86_64' 'mpfr-devel.x86_64' 'pigz' 'dkms' 'libpng12' 'xorg-x11-server-utils.x86_64' 'xorg-x11-xauth.x86_64' 'xorg-x11-server-common.x86_64' 'xorg-x11-server-Xorg.x86_64' 'fontconfig')

# For CentOS
#INSTALL_LIST=('wget' 'ntpdate' 'vim' 'nmon' 'htop' 'arp' 'taskset' 'telnet' 'valgrind' 'mariadb' 'mysql-devel' 'mysql++' 'mysql++-devel' 'zeromq' 'tmux' 'tree' 'net-tools' 'iperf' 'nc' 'nmap' 'libpcap-devel' 'perf' 'fping' 'python3' 'tcpreplay' 'zlib-devel*' 'gmp-devel.x86_64' 'libmpc-devel.x86_64' 'mpfr-devel.x86_64' 'nfs-utils' 'wireshark' 'prename' 'smartmontools' 'cifs-utils' 'pigz' 'mlocate' 'dkms' 'createrepo' 'libpng12' 'xorg-x11-server-utils.x86_64' 'xorg-x11-xauth.x86_64' 'xorg-x11-server-common.x86_64' 'xorg-x11-server-Xorg.x86_64' 'fontconfig' 'chrony' 'chromium' 'vsftpd' 'httpd' 'traceroute' 'lm_sensors' 'datamash')

HAS_ERR=F
NOW=`date`
echo "[info] ${NOW}" 2>&1 | tee -a ${OUTPUT_LOG}
echo "[info] start install tool script."
for pack in "${INSTALL_LIST[@]}"
do
    #PACK=${YUM_INSTALL_LIST[${index}]}
    echo "[info] installing ${pack}.." 2>&1 | tee -a ${OUTPUT_LOG}
    sudo apt-get install -y ${pack} 2>&1 | tee -a ${OUTPUT_LOG}
    #sudo yum install -y ${pack} 2>&1 | tee -a ${OUTPUT_LOG}
    if [ $? -eq 0 ];then
        echo "[info] success."
    else
        echo "[warning] install failure."
        HAS_ERR=T
    fi
    echo "" >> ${OUTPUT_LOG} 2>&1
done
echo "[info] install done."


echo ""
echo "------install restlt------"
if [[ "${HAS_ERR}" == "T" ]];then
    echo "[info] has error happened, please see log in ${OUTPUT_LOG}"
else
    echo "[info] success."
fi
echo "--------------------------"
