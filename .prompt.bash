if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      # BLUE=$(tput setaf 33)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 37)
      # GREEN=$(tput setaf 64)
      GREEN=$(tput setaf 2)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\e[m"
fi

# git branch
parse_git_branch() {
  git branch -vv 2> /dev/null | sed -e '/^[^*]/d' -e 's/\* \([^ ]\+\) \+\([^ ]\+\) \(.*\]\).*/\1 \2 \3/'
}
parse_git_repo() {
  TOPLEVEL=$(git rev-parse --show-toplevel 2> /dev/null)
  if [[ $TOPLEVEL ]]; then
    echo "$(basename $TOPLEVEL) ->"
  else
    echo ""
  fi
}

build_prompt() {
  PS1="\n"
  # git_string=$(parse_git_branch)
  # git_hash=""
  # git_remote=""
  # git_remote_msg=""
  # DETACHED_HEAD=false
  # if [[ ${git_string} =~ .*HEAD\ detached.* ]]; then
  #   DETACHED_HEAD=true
  #   git_branch=$(echo ${git_string} | sed 's/.*\((HEAD detached.*)\).*/\1/')
  # else
  #   git_branch=$(echo ${git_string} | sed 's/\([^ ]\+\) \([^ ]\+\) [[]\([^ :]\+\)\(:*.*\)[]]/\1/')
  #   git_hash=$(echo ${git_string} | sed 's/\([^ ]\+\) \([^ ]\+\) [[]\([^ :]\+\)\(:*.*\)[]]/\2/')
  #   git_remote=$(echo ${git_string} | sed 's/\([^ ]\+\) \([^ ]\+\) [[]\([^ :]\+\)\(:*.*\)[]]/\3/')
  #   git_remote_msg=$(echo ${git_string} | sed 's/\([^ ]\+\) \([^ ]\+\) [[]\([^ :]\+\)\(:*.*\)[]]/\4/')
  # fi
  # git_repo=$(parse_git_repo)

  # # truncate
  # git_branch=$(echo ${git_branch} | sed 's/\([^-_]*\)\([-_]\)\([^-_]*\)\([-_]\)\([^-_]*\)[-_].*/\1\2\3\4\5/')
  # git_remote=$(echo ${git_remote} | sed 's/\([^-_]*\)\([-_]\)\([^-_]*\)\([-_]\)\([^-_]*\)[-_].*/\1\2\3\4\5/')

  # # construct prompt
  # if [[ $git_branch ]]; then
  #   if [[ $DETACHED_HEAD == true ]]; then
  #     PS1+="${git_repo} \[$GREEN\]\${git_branch}\[$RESET\]\n"
  #   else
  #     PS1+="${git_repo} \[$GREEN\]\${git_branch}\[$RESET\] $git_hash [\[$BLUE\]$git_remote\[$RESET\]${git_remote_msg}]\n"
  #   fi
  # fi
  PS1+="\[$RED\][\[$RESET\]\t\[$RED\]]\[$RESET\] \w/\n\[$CYAN\]\u\[$RESET\]@\[$YELLOW\]\h\[$RESET\]\\$ "
}

GITSTRING=""

# new method
PROMPT_COMMAND="pwd > /tmp/whereami"
PROMPT_COMMAND="build_prompt;$PROMPT_COMMAND"
