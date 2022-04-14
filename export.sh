#!/usr/bin/env sh
cpConfirm () {
    cp $1 $2;

    if [ ! $? -ne 0 ] ; then
        # copie effectuee
        echo "Copied \033[0;32m$1\033[0m to \033[0;32m$2\033[0m.";
    fi
}

WARNME="Are you sure you want to \033[0;31mexport your local\033[0m files (y)?"
read -p "$(echo $WARNME) " choice

case "$choice" in
    y|Y )
        scriptDir=$(dirname $0);
        cpConfirm "$HOME/.variables.sh" "$scriptDir/.variables.sh";
        cpConfirm "$HOME/.aliases.sh" "$scriptDir/.aliases.sh";
        cpConfirm "$HOME/.github.sh" "$scriptDir/.github.sh";
        cpConfirm "$HOME/.utilities.sh" "$scriptDir/.utilities.sh";
        cpConfirm "$HOME/.bashrc" "$scriptDir/.bashrc";
        cpConfirm "$HOME/.vimrc" "$scriptDir/.vimrc";
        ;;

    * )
        echo "Aborted";
        ;;
esac
