#!/bin/zsh

cd "$(dirname "${BASH_SOURCE}")" || exit 1;

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		-avh --no-perms . ~;

        # run all brew installs
        sh .brew

        # download oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

        source ~/.zshrc;

        sudo dscl . -create /"Users/$USER" UserShell $(which zsh)
}

doIt;
unset doIt;
