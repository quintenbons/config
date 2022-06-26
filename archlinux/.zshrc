# Some of these commands are already done when launching i3
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

##########################
# PERSONAL CONFIGURATION #
##########################
# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTCONTROL=ignoreboth # duplicates

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bonsq/.zshrc'
autoload -Uz compinit
compinit # builtin commands

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Custom prompt
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:*' formats '%s(%F{red}%b%f)' # git(main)
PS1='%F{green}%n@%m%f %F{blue}%/%f %vcs_info_msg_0_ $ '

# Vim
bindkey -v
EDITOR=vi

# Mouse
xset m 0/1 4

# Keyboard
setxkbmap -option caps:swapescape
setxkbmap -layout us -option compose:ralt
set r rate 400 30

# Personal configuration files
for cnf in $HOME/.config/zshrc ; do
    echo $cnf;
done;

# Opening prompt
echo -e '\033[0;34m#####################'
echo -e '### \033[0;32mBASHRC LOADED \033[0;34m###'
echo -e '#####################\033[0m'
