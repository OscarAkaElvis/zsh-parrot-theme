#!/bin/zsh

theme_name=parrot
theme_file=$theme_name.zsh-theme
oh_my_zsh_themes_folder=${HOME}/.oh-my-zsh/themes

if [ ! -d $oh_my_zsh_themes_folder ]; then
    echo "ERROR: $oh_my_zsh_themes_folder not found."
    exit 1
fi

cp $theme_file $oh_my_zsh_themes_folder

if [ -f $oh_my_zsh_themes_folder/$theme_file ]; then
    echo "Installed theme"
else
    echo "ERROR: Couldn't copy to $oh_my_zsh_themes_folder"
    exit 1
fi

sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="'$theme_name'"/' ${HOME}/.zshrc

if grep -Fxq 'ZSH_THEME="'$theme_name'"' ${HOME}/.zshrc ; then 
    echo "Theme set on .zshrc"
    source "${HOME}/.zshrc"
else
    echo "ERROR: Theme not set on .zshrc"
    exit 1
fi
