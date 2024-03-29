# source ssh bashrc file with basic aliases and functions
source $HOME/.bashrc_ssh

# platform specific config
if [[ $OSTYPE == "linux-gnu" ]]; then
    # check if ssh session
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
      export DISPLAY=":0"
    fi

    # append to the history file, don't overwrite it
    shopt -s histappend

    # external scripts
    #source ${HOME}/.docker.bash

    # dircolors for colorscheme
    # eval "$(dircolors "$HOME/.dircolors/dircolors-solarized/dircolors.ansi-dark")"
    eval "$(dircolors "$HOME/.dircolors/dircolors-gruvbox/gruvbox-dark.dircolors")"

elif [[ $OSTYPE == "darwin"* ]]; then
    function focus_follows_mouse() {
      defaults write com.apple.Terminal FocusFollowsMouse -string YES
    }
fi

# python
export PYTHONPATH="/usr/local/Cellar/python/3.7.0/bin/python3:$PYTHONPATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# go
export PATH=$PATH:$HOME/go/bin

# cross platform aliases
alias rng='ranger'

# ssh
alias sshvm='ssh -p 2224 chris@127.0.0.1'
alias sshvmd='ssh -p 2226 chris@127.0.0.1'
alias sshlnx='ssh crichardson@192.168.90.207'

# gpu
alias gpumon='watch -n0.1 nvidia-smi'

# convenience
# alias python='python3' # python2 is dead
# alias pip='pip3'
# alias py3='python3'
# alias p='python3'

# ctags
#git rev-list BRANCH | while read rev; do git grep "REGEX" $rev; done

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

# grep and pipe to less with color
function greplc ()
{
  grep "$@" -r --color=always | less -R
}
# grep across multiple lines
#GREP2L_HELP="
#  grep2l pattern1 pattern2 [<options>]
#  Options:
#  -h      Print this message
#  "
function grep2l ()
{
  grep -Pzo "$1.*\\n.*$2" "${@:2}"
}

function llg() {
  vim "$(find $1* -type f -printf "%C@ %p\n" | sort | tail -n 1 | cut -d " " -f 2-)"
}

# vim functions
function vimfind() {
  vim "$( find "$@" )"
}
function vimcpp() {
  vim $(find -P . -not -path '*/\.*' -not -path '*/build*' -type f -regex '.*\.\(cpp\|hpp\|h\|cc\|c\)$')
}
function vimchanged() {
  vim $(git diff --name-only HEAD^ HEAD)
}

function change_occurrences_of_name() {
  HELP="Change all occurrences of OLDNAME to NEWNAME in all files at or below the current
directory, recursively. Symbolic links are not followed.

Usage:
  change_occurrences_of_name OLDNAME NEWNAME
  "
  if [ -z "$1" ] ; then
    echo "$HELP"
  elif [ -z "$2" ] ; then
    echo "$HELP"
  else
    find . -type f -not -path '*/\.*' -exec sed -i "s/$1/$2/g" {} \;
  fi
}

################
### builtins ###
################
function purge_scrimmage_paths() {
  export SCRIMMAGE_DATA_PATH=""
  export SCRIMMAGE_CONFIG_PATH=""
  export SCRIMMAGE_PLUGIN_PATH=""
  export SCRIMMAGE_MISSION_PATH=""
}

function sshs() {
        ssh $@ "cat > /tmp/.bashrc_temp" < ~/.bashrc_ssh
        ssh -t $@ "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
}

function cd
{
    builtin cd "$@"
    pwd > ~/.lastdir
}

if [ -f ~/.lastdir ]; then
    cd "$(cat ~/.lastdir)"
fi

# cmake
function cmake_find_package() {
  cmake --find-package -DNAME="$1" -DCOMPILER_ID=GNU -DMODE=EXIST -DLANGUAGE=CXX
}

# add .local to path
PATH=$PATH:~/.local/bin

# shellcheck source=/dev/null
source ~/.prompt.bash

# if [ -f ~/.scrimmage/setup.bash ]; then
#   # shellcheck source=/dev/null
#   source ~/.scrimmage/setup.bash
# fi

# GTRI
# SSH_ENV=$HOME/.ssh/environment
# function start_agent {
#     echo "Initializing new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add
# }
# if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
# else
#     start_agent;
# fi

# docker exec -it uav_i386-bees_integration_1 /bin/bash

# tab completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# copy bashrc over ssh
# function sshb() {
#   scp $HOME/.bashrc_ssh $1:/tmp/.bashrc_temp > /dev/null
#   ssh -t $1 "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
# }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# ssh uav54 "sudo sed -i 's/uav_real_ardupilot/uav_network_ardupilot/g' /etc/default/gtri-autonomy/autonomy_environment_file ; sudo service gtri-autonomy restart"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/crichardson8/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/crichardson8/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/crichardson8/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/crichardson8/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# AVA Lab
alias skynet='ssh crichardson8@sky1.cc.gatech.edu'
alias skynetpf='ssh -L 16008:127.0.0.1:6008 crichardson8@sky1.cc.gatech.edu'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/crichardson8/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/crichardson8/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/crichardson8/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/crichardson8/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

