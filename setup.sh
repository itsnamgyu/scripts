
DIR=$(pwd)
if [ -f "/etc/debian_version" ]; then  # Debian Linux
	sudo apt update -y
	sudo apt install -y gcc git vim tmux rsync wget

elif [[ "$OSTYPE" == "darwin"* ]]; then  # macOS
	# brew
	command -v brew >/dev/null 2>&1 || {
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	}
	
	brew install tmux
	brew install bash
	echo 'echo "/usr/local/bin/bash" >> /etc/shells' | sudo -s
	chsh -s /usr/local/bin/bash
  
else
	# Unsupported platform
	echo "Only supports debian Linux and macOS."
	exit
fi

git clone https://github.com/itsnamgyu/vim
cd vim
source install.sh
source clean.sh

git clone https://github.com/itsnamgyu/bash
cd bash
source install.sh
source clean.sh

git clone https://github.com/itsnamgyu/setup
cd setup
source install.sh
source clean.sh

echo "############################ Additional Items ###############################"
echo "curl -L jupytervim.namgyu.com | sh"
echo "https://www.anaconda.com/products/individual#Downloads"
