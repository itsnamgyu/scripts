DIR=$(pwd)

lif [[ "$OSTYPE" == "darwin"* ]]; then  # macOS
	# brew
	command -v brew >/dev/null 2>&1 || {
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	}
	
	brew install tmux
	brew install bash
	echo 'echo "/usr/local/bin/bash" >> /etc/shells' | sudo -s
	chsh -s /usr/local/bin/bash
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
