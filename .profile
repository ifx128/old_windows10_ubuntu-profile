# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  Native .bashrc configuration
#  4.  Functions
#  ---------------------------------------------------------------------------


#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
#   export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
#    export PS2="| => "
    # export PS1="$(tput bold)\h:\W \u\$(parse_git_branch)\[\033[00m\]\$ "    # default with limited git branch name


#   Set Paths
#   ------------------------------------------------------------
    #  C:\Program Files\Java\jdk-13.0.2\bin
    export JAVA_HOME="/mnt/c/Program Files/Java/jdk-13.0.2/bin"
    export AWS_COMPLETER="/usr/local/bin/aws_completer"
    # export JAVA_HOME="/usr/lib/jvm/java-13-openjdk-amd64"
    export JENV_BIN="/mnt/c/Users/ivanf/.jenv/bin"
    export PATH="$HOME/bin:$HOME/.local/bin:/home/ifx/development-libs/flutter/bin:$JENV_BIN:/home/ifx/development-libs/android-studio/bin:$AWS_COMPLETER:$PATH"
    export EDITOR="vim"

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
#    export EDITOR=/usr/bin/nano

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
#   export CLICOLOR=1
#   export LSCOLORS=ExFxBxDxCxegedabagacad

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias ~="cd ~"                              # ~:            Go Home
alias bashrc='code ~/.bashrc'
alias bashprofile='code ~/.profile ~/.bashrc'
alias c='clear'                             # c:            Clear terminal display
cd() { builtin cd "$@"; ls -FGlAhp; }       # Always list directory contents upon 'cd'
alias cd-win10-ivan="cd /mnt/c/Users/ivanf/"
alias cdev='cd ~/dev-ws'
alias cdec='cd /mnt/c/Users/ivanf/eclipse-workspace'
alias cdeco='cd /mnt/c/Users/ivanf/other-workspace'
alias cdng='cd /mnt/c/Users/ivanf/ng-workspace'
alias cdoc='cd /mnt/c/Users/ivanf/Documents'
alias cdpy='cd /mnt/c/Users/ivanf/PycharmProjects'
alias cdsk='cd /mnt/c/Users/ivanf/Desktop'
alias cdwn='cd /mnt/c/Users/ivanf/Downloads'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .2='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
alias gist='git branch && printf "\n" &&  git status'
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
alias mci='mvn clean install'
alias nightmode='redshift-gtk'
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias f='nohup nautilus . > /dev/null &'
alias android-studio="sudo /home/ifx/development-libs/android-studio/bin/studio.sh"
# alias f='nautilus . >/dev/null 2>&1'/
alias o='nautilus .'
# alias open='nautilus . >/dev/null 2>&1'
alias refresh='source ~/.bashrc && source ~/.profile'
# alias test='echo "source ~/.bashrc ~/.profile"'
compile-typescript-and-execute () { npx tsc "$@".ts  && node "$@".js; }
#docker aliases
alias docker='sudo docker'
alias dils='docker image ls'
alias dps='docker ps'
alias dpsa='docker ps -a'

#java versions
# https://askubuntu.com/questions/740757/switch-between-multiple-java-versions#740782
alias set-java8='sudo update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64'
alias set-java13='sudo update-java-alternatives --set /usr/lib/jvm/java-1.13.0-openjdk-amd64'

#git aliases
gist='git branch && printf "\n\n" && git status'
#alias nightmode='nohup redshift-gtk'
#alias cp='cp -iv'                           # Preferred 'cp' implementation
#alias mv='mv -iv'                           # Preferred 'mv' implementation
#alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
#alias less='less -FSRXc'                    # Preferred 'less' implementation
#alias which='type -all'                     # which:        Find executables
#alias show_options='shopt'                  # Show_options: display bash options settings
#alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
#    mans () {
#        man $1 | grep -iC2 --color=always $2 | less
#    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

#   -----------------------------
#   3. NATIVE .BASHRC CONFIGURATION
#   -----------------------------\

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# # Alias definitions.
# # You may want to put all your additions into a separate file like
# # ~/.bash_aliases, instead of adding them here directly.
# # See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ifx/.sdkman"
[[ -s "/home/ifx/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ifx/.sdkman/bin/sdkman-init.sh"

#   -----------------------------
#   4. FUNCTIONS
#   -----------------------------\


#   parse_git_branch:   parse pure git branch name out
#   --------------------------------------------------------------------
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
eval "$(jenv init -)"
