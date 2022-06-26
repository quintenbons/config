#!/usr/bin/env zsh
cpConfirm () {
    cp -r $1 $2;

    if [ ! $? -ne 0 ] ; then
        # copie effectuee
        echo "Copied \033[0;32m$1\033[0m to \033[0;32m$2\033[0m.";
    fi
}

WARNME="Are you sure you want to \033[0;31mexport your local (to git)\033[0m files (Y/y)?"

if read -q "choice?$WARNME" ; then
    echo
    scriptDir=$(dirname $0);

    cpConfirm "$HOME/.zshrc" "$scriptDir/.zshrc";
    cpConfirm "$HOME/.vimrc" "$scriptDir/.vimrc";
    cpConfirm "$HOME/.config/zshrc" "$scriptDir/.config/zshrc";
    cpConfirm "$HOME/.config/i3" "$scriptDir/.config/i3" ;
    cpConfirm "$HOME/.config/i3status" "$scriptDir/.config/i3status" ;
    cpConfirm "$HOME/.config/kitty" "$scriptDir/.config/kitty" ;
    cpConfirm "$HOME/.config/nvim" "$scriptDir/.config/nvim" ;
    cpConfirm "$HOME/.config/picom" "$scriptDir/.config/picom" ;
else
    echo
    echo "Aborted";
fi;
