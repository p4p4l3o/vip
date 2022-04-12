#!/bin/bash
if [[ -e /etc/debian_version ]]; then
  OS=debian
  RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
  OS=centos
  RCLOCAL='/etc/rc.d/rc.local'
  chmod +x /etc/rc.d/rc.local
else
  echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
  exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
MYIP=$(wget -qO- icanhazip.com);

clear
echo -e ""
echo -e "================-Welcome To Premium Script Menu-================" | lolcat
    echo "----------------- Moded By Gugun09 --------------------"
  cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
  cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
  freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
  tram=$( free -m | awk 'NR==2 {print $2}' )
  swap=$( free -m | awk 'NR==4 {print $2}' )
  up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

  echo -e "\e[032;1mCPU Model:\e[0m $cname"
  echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
  echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
  echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
  echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
  echo -e "\e[032;1mSystem Uptime:\e[0m $up"
  echo "================================================================="
  echo ""
echo -e "=========================-SSH & OpenVPN-========================" | lolcat
echo -e "${color1}1${color3}.Create SSH & OpenVPN Account (${color2}usernew${color3})"
echo -e "${color1}2${color3}.Generate SSH & OpenVPN Trial Account (${color2}trial${color3})"
echo -e "${color1}3${color3}.Extending SSH & OpenVPN Account Active Life (${color2}renew${color3})"
echo -e "${color1}4${color3}.Delete SSH & OpenVPN Account (${color2}hapus${color3})"
echo -e "${color1}5${color3}.Check User Login SSH & OpenVPN (${color2}cek${color3})"
echo -e "${color1}6${color3}.Daftar Member SSH & OpenVPN (${color2}member${color3})"
echo -e "${color1}7${color3}.Delete User Expired SSH & OpenVPN (${color2}delete${color3})"
echo -e "${color1}8${color3}.Set up Autokill SSH (${color2}autokill${color3})"
echo -e "${color1}9${color3}.Displays Users Who Do Multi Login SSH (${color2}ceklim${color3})"
echo -e "${color1}10${color3}.Restart Service Dropbear, Squid3, OpenVPN dan SSH (${color2}restart${color3})"
echo -e ""
echo -e "===========================-Wireguard-=========================" | lolcat
echo -e "${color1}11${color3}.Create Wireguard Account (${color2}add-wg${color3})"
echo -e "${color1}12${color3}.Delete Wireguard Account (${color2}del-wg${color3})"
echo -e "${color1}13${color3}.Check User Login Wireguard (${color2}cek-wg${color3})"
echo -e "${color1}14${color3}.Extending Wireguard Account Active Life (${color2}renew-wg${color3})"
echo -e "${color1}15${color3}.Check Wireguard User Interface (${color2}wg show${color3})"
echo -e ""
echo -e "=============================-L2TP-============================" | lolcat
echo -e "${color1}16${color3}.Creating L2TP Account (${color2}add-l2tp${color3})"
echo -e "${color1}17${color3}.Deleting L2TP Account (${color2}del-l2tp${color3})"
echo -e "${color1}18${color3}.Extending L2TP Account Active Life (${color2}renew-l2tp${color3})"
echo -e ""
echo -e "=============================-PPTP-============================" | lolcat
echo -e "${color1}19${color3}.Create Account PPTP (${color2}add-pptp${color3})"
echo -e "${color1}20${color3}.Delete PPTP Account (${color2}del-pptp${color3})"
echo -e "${color1}21${color3}.Extending PPTP Account Active Life (${color2}renew-pptp${color3})"
echo -e "${color1}22${color3}.Check User Login PPTP (${color2}cek-pptp${color3})"
echo -e ""
echo -e "=============================-SSTP-============================" | lolcat
echo -e "${color1}23${color3}.Create Account SSTP (${color2}add-sstp${color3})"
echo -e "${color1}24${color3}.Delete SSTP Account (${color2}del-pptp${color3})"
echo -e "${color1}25${color3}.Extending SSTP Account Active Life (${color2}renew-pptp${color3})"
echo -e "${color1}26${color3}.Check User Login SSTP (${color2}cek-pptp${color3})"
echo -e ""
echo -e "=============================-SSR-=============================" | lolcat
echo -e "${color1}27${color3}.Create SSR Account (${color2}add-ssr${color3})"
echo -e "${color1}28${color3}.Deleting SSR Account (${color2}del-ssr${color3})"
echo -e "${color1}29${color3}.Extending SSR Account Active Life (${color2}renew-ssr${color3})"
echo -e "${color1}30${color3}.Show Other SSR Menu (${color2}ssr${color3})"
echo -e ""
echo -e "========================-Shadowsocks OBFS-=====================" | lolcat
echo -e "${color1}31${color3}.Creating Shadowsocks Account (${color2}add-ss${color3})"
echo -e "${color1}32${color3}.Delete Shadowsocks Account (${color2}del-ss${color3})"
echo -e "${color1}33${color3}.Extending Shadowsocks Account Active Life (${color2}renew-ss${color3})"
echo -e "${color1}34${color3}.Check User Login Shadowsocks (${color2}cek-ss${color3})"
echo -e ""
echo -e "=============================-VMESS-===========================" | lolcat
echo -e "${color1}35${color3}.Create V2RAY Vmess Websocket Account (${color2}add-ws${color3})"
echo -e "${color1}36${color3}.Deleting V2RAY Vmess Websocket Account (${color2}del-ws${color3})"
echo -e "${color1}37${color3}.Extending Vmess Account Active Life (${color2}renew-ws${color3})"
echo -e "${color1}38${color3}.Check User Login V2RAY (${color2}cek-ws${color3})"
echo -e "${color1}39${color3}.Renew Certificate V2RAY Account (${color2}cert2vray${color3})"
echo -e ""
echo -e "=============================-VLESS-===========================" | lolcat
echo -e "${color1}40${color3}.Create V2RAY Vless Websocket Account (${color2}add-vless${color3})"
echo -e "${color1}41${color3}.Deleting V2RAY Vless Websocket Account (${color2}del-vless${color3})"
echo -e "${color1}42${color3}.Extending Vless Account Active Life (${color2}renew-vless${color3})"
echo -e "${color1}43${color3}.Check User Login V2RAY (${color2}cek-vless${color3})"
echo -e ""
echo -e "==============================-XRAY-===========================" | lolcat
echo -e "${color1}44${color3}.Create XRAY Websocket Account (${color2}add-xws${color3})"
echo -e "${color1}45${color3}.Deleting XRAY Websocket Account (${color2}del-xws${color3})"
echo -e "${color1}46${color3}.Extending XRAY Account Active Life (${color2}renew-xws${color3})"
echo -e "${color1}47${color3}.Check User Login (${color2}cek-xws${color3})"
echo -e ""
echo -e "===========================-Trojan VPN-========================" | lolcat
echo -e "${color1}48${color3}.Create Trojan Account (${color2}add-tr${color3})"
echo -e "${color1}49${color3}.Deleting Trojan Account (${color2}del-tr${color3})"
echo -e "${color1}50${color3}.Extending Trojan Account Active Life (${color2}renew-tr${color3})"
echo -e "${color1}51${color3}.Check User Login Trojan (${color2}cek-tr${color3})"
echo -e ""
echo -e "=============================-Trojan GO-=======================" | lolcat
echo -e "${color1}52${color3}.Create Trojan GO Account (${color2}add-trgo${color3})"
echo -e "${color1}53${color3}.Deleting Trojan GO Account (${color2}del-trgo${color3})"
echo -e "${color1}54${color3}.Extending Trojan GO Account Active Life (${color2}renew-trgo${color3})"
echo -e ""
echo -e "=============================-SYSTEM-==========================" | lolcat
echo -e "${color1}55${color3}.Check Your Service Running (${color2}running${color3})"
echo -e "${color1}56${color3}.Add Or Change Subdomain Host For VPS (${color2}add-host${color3})"
echo -e "${color1}57${color3}.Change Port Of Some Service (${color2}change-port${color3})"
echo -e "${color1}58${color3}.Autobackup Data VPS (${color2}autobackup${color3})"
echo -e "${color1}59${color3}.Backup Data VPS (${color2}backup${color3})"
echo -e "${color1}60${color3}.Restore Data VPS (${color2}restore${color3})"
echo -e "${color1}61${color3}.Webmin Menu (${color2}wbmn${color3})"
echo -e "${color1}62${color3}.Update To Latest Kernel (${color2}kernel-updt${color3})"
echo -e "${color1}63${color3}.Limit Bandwith Speed Server (${color2}limit-speed${color3})"
echo -e "${color1}64${color3}.Check Usage of VPS Ram (${color2}ram${color3})"
echo -e "${color1}65${color3}.Reboot VPS (${color2}reboot${color3})"
echo -e "${color1}66${color3}.Speedtest VPS (${color2}speedtest${color3})"
echo -e "${color1}67${color3}.Update To Latest Script Version (${color2}update${color3})"
echo -e "${color1}68${color3}.Displaying System Information (${color2}info${color3})"
echo -e "${color1}69${color3}.Info Script Auto Install (${color2}about${color3})"
echo -e "${color1}0${color3}.Exit Menu VPS (${color2}exit${color3})"
echo -e ""
echo -e "===============================================================" | lolcat
read -p "Choose an option from (1-69): " x
case $x in
1)
usernew
;;
2)
trial
;;
3)
renew
;;
4)
hapus
;;
5)
cek
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)ceklim
;;
10)
restart
;;
11)
add-wg
;;
12)
del-wg
;;
13)
cek-wg
;;
14)
renew-wg
;;
15)
wg show
;;
16)
add-l2tp
;;
17)
del-l2tp
;;
18)
renew-l2tp
;;
19)
add-pptp
;;
20)
del-pptp
;;
21)
renew-pptp
;;
22)
cek-pptp
;;
23)
add-sstp
;;
24)
del-sstp
;;
25)
renew-sstp
;;
26)
cek-sstp
;;
27)
add-ssr
;;
28)
del-ssr
;;
29)
renew-ssr
;;
30)
ssr
;;
31)
add-ss
;;
32)
del-ss
;;
33)
renew-ss
;;
34)
cek-ss
;;
35)
add-ws
;;
36)
del-ws
;;
37)
renew-ws
;;
38)
cek-ws
;;
39)
cert2vray
;;
40)
add-vless
;;
41)
del-vless
;;
42)
renew-vless
;;
43)
cek-vless
;;
44)
add-xws
;;
45)
del-xws
;;
46)
renew-xws
;;
47)
cek-xws
;;
48)
add-tr
;;
49)
del-tr
;;
50)
renew-tr
;;
51)
cek-tr
;;
52)
add-trgo
;;
53)
del-trgo
;;
54)
renew-trgo
;;
55)
running
;;
56)
add-host
;;
57)
change-port
;;
58)
autobackup
;;
59)
backup
;;
60)
restore
;;
61)
wbmn
;;
62)
kernel-updt
;;
63)
limit-speed
;;
64)
ram
;;
65)
reboot
;;
66)
speedtest
;;
67)
update
;;
68)
info
;;
69)
about
;;
0)
clear
echo "Goodbye Menu!"
echo "Please Wait..."
sleep 3
clear
neofetch
welcomeadmin
exit
;;
*)
clear
echo "Back to menu"
echo "Please Wait..."
menu
;;
esac