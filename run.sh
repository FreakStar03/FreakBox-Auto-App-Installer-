#!/bin/bash
val="Install"
declare -a Install_ARRAY=("All" "Vs Code" "Chrome" "Spotify" "Java"  "Zoom" "firewall gufw" "Y ppa manager" "gnome tweak" "gnome hide notification bar" "fish" "polybar"  "neovim" "wireshark" "postman" "ngrok" "php" "Android Studio" "snapd" "phpmyadmin" "upgrade")   

count=0
for i in "${Install_ARRAY[@]}";
    do
    count=$((count+1))
    printf "$count) $val $i \n";
done   

printf "Index: "  
read value


Vs_Code () {
    sudo apt update
    sudo apt install -y software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install -y code
    printf "\n Yes/No: "  
    read subvalue
    if [[ $subvalue == "Yes" || $subvalue == "Y" || $subvalue == "y" || $subvalue == "yes" || $subvalue == "YES" ]]
        then 
        echo "Installing Vs Extensions!"
        code --install-extension ritwickdey.LiveServer
        code --install-extension esbenp.prettier-vscode
        code --install-extension streetsidesoftware.code-spell-checker
        code --install-extension TabNine.tabnine-vscode
        code --install-extension ms-python.python
        code --install-extension vscjava.vscode-java-pack
        else  
        echo "Not Installing Vs Extensions."  
    fi  
}

chrome () {
    cd ~/Downloads
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
}

spotify () {
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt update
    sudo apt install -y spotify-client
}

java () {
    sudo apt update
    sudo apt install -y openjdk-11-jdk
}

zoom () {
    cd ~/Downloads
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install -y ./zoom_amd64.deb               
}

firewall () {
    sudo apt install -y gufw
}

ppa_manager () {
    sudo add-apt-repository ppa:webupd8team/y-ppa-manager
    sudo apt update
    sudo apt install -y y-ppa-manager

}


gnome_tweak () {
                sudo add-apt-repository universe
                sudo apt install -y gnome-tweak-tool
}

hide_top () {
                echo "Installing Hide Top Bar!"
                sudo apt install -y gnome-shell-extension-autohidetopbar
}

fish_shell () {
                echo "Installing Fish Shell!"
                sudo apt install -y fish
                chsh -s /usr/bin/fish
    }
polybar () {
    echo "Installing polybar with theme!"
    # git
    sudo apt install -y git

    sudo apt-get install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev
    sudo apt install -y libxcb-composite0-dev
    sudo apt install -y libjsoncpp-dev
    sudo ln -s /usr/include/jsoncpp/json/ /usr/include/json
    git clone https://github.com/jaagr/polybar.git
    cd polybar && chmod +x ./build.sh && ./build.sh

    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install

    wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/libplayerctl2_2.0.1-1_amd64.deb
    wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/playerctl_2.0.1-1_amd64.deb
    sudo dpkg -i libplayerctl2_2.0.1-1_amd64.deb playerctl_2.0.1-1_amd64.deb

    # zscroll
    git clone https://github.com/noctuid/zscroll
    cd zscroll
    sudo python3 setup.py install

    # rofi
    sudo apt-get install -y rofi

    # wmctrl
    sudo apt install -y wmctrl

    #my theme
    mkdir ~/.config/polybar/ && cd ~/.config/polybar/
    git clone https://github.com/FreakStar03/PopOs-Rice.git .
    chmod +x ~/.config/polybar/scripts/*.sh
    chmod +x ~/.config/polybar/*.sh
    ~/.conig/launch.sh
    }


neovim () {
    sudo apt install -y neovim 
    echo "Open Neovim with nvim"
    }
wireshark () {
    sudo add-apt-repository ppa:wireshark-dev/stable
    sudo apt-get update
    sudo apt-get install -y wireshark
    }

postman () {
    sudo apt install -y snapd
    sudo apt update
    sudo snap install -y postman
    }
ngrok () {
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
    sudo apt update && sudo apt install -y ngrok 
    }
php () {
    sudo apt-get install -y php
    }
android_studio () {
    sudo apt install -y openjdk-11-jdk
    sudo add-apt-repository ppa:maarten-fonville/android-studio
    sudo apt update
    sudo apt install -y android-studio
    }
snapd () {
    sudo apt install -y snapd
    }
    
phpmyadmin () {
sudo apt install apache2
sudo ufw allow in "Apache"
sudo apt install mysql-server
sudo apt install php libapache2-mod-php php-mysql
sudo mkdir /var/www/html/php
sudo chown -R $USER:$USER /var/www/html/php
sudo apt install phpmyadmin
sudo systemctl restart apache2
echo " "
echo "echo Include /etc/phpmyadmin/apache.conf >> /etc/apache2/apache2.conf FOR PAGE NOT FOUND ERROR}"
echo "Installed PhpMyAdmin"
echo "Create New Mysql User with Root Priveleges Or Change Root Password"
echo "FOLLOW FOLLOWING COMMAND TO CREATE NEW USER!"
echo "sudo mysql -u root -p"
echo "CREATE USER 'user-name'@'localhost' IDENTIFIED BY 'NEW_USER_PASSWORD';"
echo "GRANT ALL PRIVILEGES ON *.* TO 'user-name'@'localhost' WITH GRANT OPTION;"
echo "FLUSH PRIVILEGES;"
echo "FOLLOW FOLLOWING COMMAND TO Change ROOT USER PASSWORD!"
echo "ALTER USER 'user-name'@'localhost' IDENTIFIED BY 'NEW_USER_PASSWORD';"
echo "FLUSH PRIVILEGES;"
}


DIR=`pwd`
FDIR="$HOME/.local/share/fonts"

install_fonts() {
    echo -e "\n[*] Installing fonts..."
    if [[ -d "$FDIR" ]]; then
        cp -rf $DIR/fonts/* "$FDIR"
    else
        mkdir -p "$FDIR"
        cp -rf $DIR/fonts/* "$FDIR"
    fi
}


upgrade () {
    sudo apt update
    sudo apt upgrade
    }

all_app () {
    echo "Installing update and upgrade!"
    upgrade
    sudo apt install -y git && sudo apt-get install -y wget && sudo apt-get install -y curl
    
    echo "Installing Vs COde!"
    Vs_Code

    echo "Installing Chrome!"
    chrome

    echo "Installing Spotify!"
    spotify

    echo "Installing Java Open jdk 11!"
    java

    echo "Installing Zoom!"
    zoom

    echo "Installing Firewall!"
    firewall

    echo "Installing y-ppa-manager!"
    ppa_manager

    echo "Installing gnome-tweak-tool!"
    gnome_tweak

    echo "Installing Hide Top Bar!"
    hide_top

    echo "Installing Fish Shell!"
    fish_shell

    echo "Installing polybar with theme!"
    install_fonts
    polybar

    echo "Installing Neovim!"
    neovim

    echo "Installing wireshark!"
    wireshark

    echo "Installing postman!"
    postman

    echo "Installing Ngrok!"
    ngrok

    echo "Installing php!"
    php

    echo "Installing android-studio!"
    android_studio

    echo "Installing snapd!"
    snapd
    
    echo "Installing PHPMYADMIN"
    phpmyadmin
}

case $value in
    1)
            echo "Installing All"
            all_app
            ;;
    2)
            echo "Installing Vs COde!"
            Vs_Code
            ;;
    3)
            echo "Installing Chrome!"
            chrome
            ;;
    4)
            echo "Installing Spotify!"
            spotify
            ;;
    5)
            echo "Installing Java Open jdk 11!"
            java
            ;;
    6)
            echo "Installing Zoom!"
            zoom
            ;;
    7)
            echo "Installing Firewall!"
            firewall
            ;;
    8)
            echo "Installing y-ppa-manager!"
            ppa_manager
            ;;
    9)
            echo "Installing gnome-tweak-tool!"
            gnome_tweak
            ;;
    10)
            echo "Installing Hide Top Bar!"
            hide_top
            ;;
    11)
            echo "Installing Fish Shell!"
            fish_shell
            ;;
    12)
            echo "Installing polybar and Fonts with MyConfig theme!"
            install_fonts
            polybar
            ;;
    13)
            echo "Installing Neovim!"
            neovim
            ;;
    14)
            echo "Installing wireshark!"
            wireshark
            ;;
    15)
            echo "Installing postman!"
            postman
            ;;
    16)
            echo "Installing Ngrok!"
            ngrok
            ;;
    17)
            echo "Installing php!"
            php
            ;;
    18)
            echo "Installing android-studio!"
            android_studio
            ;;
    19)
            echo "Installing snapd!"
            snapd
            ;;
    20)
            echo "Installing PhpMyAdmin!"
            phpmyadmin
            ;;
    21)
            echo "Installing update and upgrade!"
            upgrade
            ;;
    *)
            echo "That's Wrong Value!"
            ;;
esac


