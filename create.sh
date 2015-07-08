#!/bin/bash

while true; do
    read -p "Do you wish to reset the files on the home folder?" yn
    case $yn in
        [Yy]* ) remove=true; break;;
        [Nn]* ) remove=false; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

function remove {

    if [ "$2" = true ]; then
        sudo rm -f "$1"
    else
        rm -f "$1"
    fi

}

function createLinkIfDoesntExist {

    if [ "$3" = true ]; then
        remove "$2" "$4"
    fi

	if [ ! -e $2 ]; then
		echo "Adding link: $1 -> $2";
        if [ "$4" = true ]; then
            sudo ln -s "$1" "$2";
        else
            ln -s "$1" "$2";
        fi

	else
		echo "File $2 already exist:";
		echo "$(ls -la $2)";
	fi

}

cwd=$PWD
shortCwd=${cwd/$HOME/"~"}
echo $cwd;
cd $cwd;

# Copying home files
cd "$cwd/home"
for f in *; do
    if [ "$remove" = true ]; then remove ~/".$f"; fi
    echo "Adding $shortCwd/home/$f -> ~/.$f";
    sed "s|INSTALL_FOLDER|$shortCwd|g" "$f" >> ~/".$f";
done
cd "$cwd"

# Copying Links
cd "$cwd/links"
for f in *; do
    createLinkIfDoesntExist "$cwd/links/$f" ~/".$f" $remove;
done
cd "$cwd"

# if [ -z "$(which zsh)" ]; then
	# echo "Installing ZSH:"
	#brew install zsh
# fi

zshfpath='/usr/share/zsh/site-functions'
zshfpath2='/usr/local/share/zsh/site-functions'
if [ -d "$zshfpath" ]; then
    createLinkIfDoesntExist "$cwd/zsh/pure/pure.zsh" "$zshfpath/prompt_pure_setup" $remove true;
fi

if [ -d "$zshfpath" ]; then
    createLinkIfDoesntExist "$cwd/zsh/pure/pure.zsh" "$zshfpath2/prompt_pure_setup" $remove true;
fi
exit;

vundlefolder="$cwd/vim/_bundle/Vundle.vim"
if [ ! -d "$vundlefolder/.git" ]; then
    echo "Cloning Vundle repo"
    mkdircd "$vundlefolder"
    git clone https://github.com/gmarik/Vundle.vim.git .
else
    echo "Vundle Repo already Cloned"
fi

echo "Everything deployed, configure your username/email for git in ~/.giconfig and run :PluginInstall in Vim"
cd "$cwd"
