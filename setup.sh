#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
	echo "You need to run this script as root"
	exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
	echo "OpenVZ is not supported"
	exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com)
IZIN=$(wget -qO- icanhazip.com | grep $MYIP)
if [ $MYIP = $IZIN ]; then
	echo -e "${green}PermissionAccepted...${NC}"
else
	echo -e "${red}Permission Denied!${NC}"
	echo -e "Please Contact Admin"
	echo -e "+6281357879215"
	rm -f /root/setup.sh
	exit 0
fi
clear
if [ -f "/etc/v2ray/domain" ]; then
	echo "Script Already Installed"
	exit 0
fi
mkdir /var/lib/premium-script
echo "IP=" >>/var/lib/premium-script/ipvps.conf
custom() {
	wget "https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/custom_cf.sh" && chmod +x custom_cf.sh && sed -i -e 's/\r$//' custom_cf.sh && ./custom_cf.sh && rm -f /root/add-cf.sh
	clear
	echo "Mempersiapkan install custom domain..."
	sleep 5
	Install_sc
	log_install
}

onscript() {
	wget https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/install_cf.sh && chmod +x install_cf.sh && ./install_cf.sh && rm -f /root/install_cf.sh
	Install_sc
	log_install
}
Install_sc() {
	#install ssh ovpn
	wget https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh && rm -f /root/ssh-vpn.sh
	#install edu
	wget https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/websocket.sh && chmod +x websocket.sh && screen -S websocket ./websocket.sh && rm -f /root/websocket.sh
	#install v2ray
	wget https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh && rm -f /root/ins-vt.sh
	wget https://raw.githubusercontent.com/AKUNGITHUBMU/NAMAFOLDERGITHUB/master/set-br.sh && chmod +x set-br.sh && ./set-br.sh && rm -f /root/set-br.sh
}
log_install() {
	history -c
	echo "1.2" >/home/ver
	clear
	echo " "
	echo "Installation has been completed!!"
	echo " "
	echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "   >>> Service & Port" | tee -a log-install.txt
	echo "   - OpenSSH                 : 22" | tee -a log-install.txt
	echo "   - OpenVPN                 : TCP 443, 1194, UDP 2200, SSL 442" | tee -a log-install.txt
	echo "   - Stunnel4                : 443, 445, 990" | tee -a log-install.txt
	echo "   - SSH Websocket           : 8880" | tee -a log-install.txt
	echo "   - SSL Websocket           : 443" | tee -a log-install.txt
	echo "   - Dropbear                : 143, 109" | tee -a log-install.txt
	echo "   - Squid Proxy             : 3128, 8080, 8888 (limit to IP Server)" | tee -a log-install.txt
	echo "   - Badvpn                  : 7100, 7200, 7300" | tee -a log-install.txt
	echo "   - Nginx                   : 81" | tee -a log-install.txt
	echo "   - V2RAY Vmess TLS         : 8443" | tee -a log-install.txt
	echo "   - V2RAY Vmess None TLS    : 80" | tee -a log-install.txt
	echo "   - V2RAY Vless TLS         : 2083" | tee -a log-install.txt
	echo "   - V2RAY Vless None TLS    : 2082" | tee -a log-install.txt
	echo "   - Trojan                  : 2087" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "   >>> Server Information & Other Features" | tee -a log-install.txt
	echo "   - Timezone                : Asia/Malaysia (GMT +8)" | tee -a log-install.txt
	echo "   - Fail2Ban                : [ON]" | tee -a log-install.txt
	echo "   - Dflate                  : [ON]" | tee -a log-install.txt
	echo "   - IPtables                : [ON]" | tee -a log-install.txt
	echo "   - Auto-Reboot             : [ON]" | tee -a log-install.txt
	echo "   - IPv6                    : [OFF]" | tee -a log-install.txt
	echo "   - Autoreboot On 00:00 GMT +8" | tee -a log-install.txt
	echo "   - Autobackup Data" | tee -a log-install.txt
	echo "   - Restore Data" | tee -a log-install.txt
	echo "   - Auto Delete Expired Account" | tee -a log-install.txt
	echo "   - Full Orders For Various Services" | tee -a log-install.txt
	echo "   - White Label" | tee -a log-install.txt
	echo "   - Installation Log --> /root/log-install.txt" | tee -a log-install.txt
	echo "" | tee -a log-install.txt
	echo "   - Telegram                : T.me/tatsumaru" | tee -a log-install.txt
	echo "   - Whatsapp                : 6281357879215" | tee -a log-install.txt
	echo "------------------Script Mod By Gugun09-----------------" | tee -a log-install.txt
	echo ""
	rm -f setup.sh
	echo "Sistem akan reboot wait..."
	sleep 15
	reboot
}
clear
menu() {
	clear
	echo "================================"
	echo "What do you want to do?"
	echo -e ""
	echo -e "[1] Custom your domain"
	echo -e "[2] Use Default domain script"
	echo "================================"
	read -p "Choose an option from (1-2): " x
	case $x in
	1)
		custom
		;;
	2)
		onscript
		;;
	*)
		exit 1
		;;
	esac
}
menu
