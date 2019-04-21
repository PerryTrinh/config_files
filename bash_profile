#########################
######## ALIASES ########
#########################

#Directories
alias ls='ls -GFh'
alias lsl='ls -l'
alias lsa='ls -a'

#extraneous commands
alias g='git status'
alias gl='git log --graph'
alias gb='git branch'
alias gc='git checkout'
alias reloadb='source ~/.bash_profile'
alias clr='clear'
alias cl='function _cdl() {
  cd "$1" && ls
};
_cdl'
alias hash='shasum -a 256'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

###########################
####### PS1 CHANGES #######
###########################

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
 parse_git_dirty() {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st == "" ]]; then
        echo ''
    elif [[ $st == "nothing to commit, working tree clean" ]]; then
        echo ''
    elif [[ $st == 'nothing added to commit but untracked files present (use "git add" to track)' ]]; then
        echo '?'
    else
        echo '*'
    fi
}

# coloring the terminal command line
SB_GREEN="\[\033[1;32m\]"
SB_BLUE="\[\033[1;34m\]"
SB_RED="\[\033[1;31m\]"
SB_NOCOLOR="\[\033[0m\]"

fill="—- "
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black

PS1="$status_style"'$fill \t\n'"$prompt_style${SB_GREEN}Perry: ${SB_BLUE}\W$SB_GREEN\$(parse_git_branch)$SB_RED\$(parse_git_dirty)$SB_NOCOLOR >$command_style "

trap 'echo -ne "\033[00m"' DEBUG

function prompt_command {
let fillsize=${COLUMNS}-9
fill=""
while [ "$fillsize" -gt "0" ]
do
fill="-${fill}" # fill with underscores to work on
let fillsize=${fillsize}-1
done
case "$TERM" in
xterm*|rxvt*)
bname=`basename "${PWD/$HOME/~}"`
echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
;;
*)
;;
esac
}
PROMPT_COMMAND=prompt_command

export LSCOLORS=ExFxBxDxCxegedabagacad

