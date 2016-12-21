# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# ;;
#*)
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# ;;
#esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# color names for readibility
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magneta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

COLOR_BROWN='\e[0;33m'
COLOR_BLUE='\e[0;34m'
COLOR_GRAY='\e[0;30m'
COLOR_LIGHT_GRAY='\e[0;37m'
COLOR_GREEN='\e[0;32m'

#Green if vanilla user
user_color=$COLOR_GREEN

#Go red if we're root
[ "$UID" -eq 0 ] && { user_color=$red; }

#hostname_color=$green

case $HOSTNAME in
  *prod-*) hostname_color='${red}';; # red on *prod-*
  *acce-*) hostname_color='${yellow}';; # yellow on *[test|acce]-*
  *test-*) hostname_color='${yellow}';; # yellow on *[test|acce]-*
  *utv-*) hostname_color='${green}';; # green on *[dev|utv]-*
  *dev-*) hostname_color='${green}';; # green on *[dev|utv]-*
  *) hostname_color='${black}';; # green elsewhere
esac

PS1="\[$user_color\]\u\[$reset\]\[$white\]@\[$bold\]\[$hostname_color\]\h\[$white\]:\[$blue\]\w\[$reset\]\[$white\]\\$\[$reset\] "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
;;
*)
;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
eval "`dircolors -b`"
alias ls='ls --color=auto'
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

#My alias
alias u='sudo apt-get update && sudo apt-get dist-upgrade $1'
alias sn='screen -S $1'
alias sl='screen -list'
alias sa='screen -r $1'
alias restartpanel='kill $(pgrep unity-panel-ser)'
alias reload_icons='sudo gtk-update-icon-cache --ignore-theme-index -f -q /usr/share/icons/hicolor/'

export EDITOR=vim
