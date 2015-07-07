#!/bin/bash

function createLinkIfDoesntExist {

	if [ ! -e $2 ]; then
		echo "Adding link: $1 -> $2"
		sudo ln -s "$1" "$2"
	else
		echo "File $2 already exist:"
		echo "$(ls -la $2)"
	fi

}


cwd=$PWD
zshfpath='/usr/share/zsh/site-functions'
if [ -z "$(which zsh)" ]; then
	echo "Installing ZSH:"
	#brew install zsh
fi
if [ -d "$zshfpath" ]; then
	echo "Adding pureZsh:"
	createLinkIfDoesntExist "$PWD/zsh/pure/pure.zsh" "$zshfpath/prompt_pure_setup"
fi
cd ~
for f in $(ls $cwd/home.*)
do
	file=${f/$cwd\/home/}
	createLinkIfDoesntExist "$f" "$file"
done
createLinkIfDoesntExist "$cwd/vim" ".vim"

# Back to normal directory
cd $cwd

cd vim	
mkdir _bundle
cd _bundle
git clone https://github.com/gmarik/Vundle.vim.git
cd ..
