# Colors
RESET="\[\017\]"
NORMAL="\[\033[00m\]"
RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
CYAN="\[\033[0;36m\]"
CYAN_BOLD="\[\033[01;36m\]"
WHITE="\[\033[0;37m\]"

OK="${GREEN}$(echo -e "\u2713")${NORMAL}"
NOK="${RED}$(echo -e "\u2718")${NORMAL}"

SELECT_RESULT="if [ \$? = 0 ]; then echo \"${OK}\"; else echo \"${NOK}\"; fi"

USER_COLOR=$CYAN_BOLD
if [ $USER = "root" ]; then
        USER_COLOR=$RED_BOLD
fi

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Throw it all together
PS1="\n${RESET}${USER_COLOR}\u${NORMAL} ${WHITE}in${NORMAL} ${CYAN_BOLD}\W${NORMAL} \`${SELECT_RESULT}\`
${YELLOW}\$(git_branch) $(echo -e "\u25BA")${NORMAL} "
