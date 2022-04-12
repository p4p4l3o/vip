#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( wget -qO- icanhazip.com | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}PermissionAccepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}"
echo -e "Please Contact Admin"
echo -e "+6281357879215"
rm -f setup.sh
exit 0
fi
clear
uuid=$(cat /etc/trojan/uuid.txt)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w Trojan | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Password: " -e user
		user_EXISTS=$(grep -w $user /etc/trojan/akun.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]] || [[ ${user_EXIST} == "1" ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
read -p "Expired (days): " masaaktif
sed -i '/"'""$uuid""'"$/a\,"'""$user""'"' /etc/trojan/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "### $user $exp" >> /etc/trojan/akun.conf
systemctl restart trojan
trojanlink="trojan://${user}@${domain}:${tr}#trojan_GFW${user}"
cat > client.json << END
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "${domain}",
    "remote_port": ${trgo},
    "dns": [
        "1.1.1.1"
    ],
    "password": [
        "${user}"
    ],
    "ssl": {
        "sni": "${domain}"
    },
    "websocket": {
        "enabled": true,
        "path": "\/wdkuvpn",
        "hostname": "${domain}"
    }
}
END
clear
echo -e ""
echo -e "=============-Trojan VPN-==========" | lolcat
echo -e "Remarks          : ${user}"
echo -e "Host/IP          : ${domain}"
echo -e "Port Trojan GFW  : ${tr}"
echo -e "Key Trojan GFW   : ${user}"
echo -e "===================================" | lolcat
echo -e "Link Trojan GFW  : ${trojanlink}"
echo -e "===================================" | lolcat
echo -e "Expired On       : $exp"
