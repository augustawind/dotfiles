#
# ~/.bash_profile
#

# check for an interactive session
[ -z "$PS1" ] && return

# environment variables ------------------------------------------------------

export PATH="$HOME/.yarn/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/share/man:$MANPATH"
export LANG="en_US.UTF-8"
export EDITOR="/usr/local/bin/nvim"
export SUDO_EDITOR="$EDITOR"
export GOPATH=$HOME/work
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src/

# imports --------------------------------------------------------------------

eval "$(thefuck --alias)"
source ~/.bash/git-completion.bash
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

eval "$(stack --bash-completion-script stack)"

source ~/.bash/bash-wakatime.sh

. ~/erlang/19.0/activate  # default Erlang install

# prompt ---------------------------------------------------------------------

export PS1="\[\033[35m\]λ\[\e[0m\] \W\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] -> "

# aliases --------------------------------------------------------------------

# gooee
alias cloudapi='cd ~/gooee/cloud-api && source makeenv.sh'

# utilities
alias tmux="tmux -2"

# applications
alias crawl-tiles='/Applications/Dungeon\ Crawl\ Stone\ Soup\ -\ Tiles.app/Contents/MacOS/Dungeon\ Crawl\ Stone\ Soup\ -\ Tiles'

# colored output
alias ls='ls -G'

# convenience
alias ..='cd ..'
alias ...='cd ...'
alias ll='ls -laF'
alias la='ls -a'
alias untmux='tmux kill-session'
alias python='python3'
alias vim='nvim'
alias evimrc='vim ~/.vimrc'
alias eviminit='vim ~/.config/nvim/init.vim'
alias ebashrc='vim ~/.bash_profile'
alias fay='stack exec fay -- '

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ln='ln -i'

# git
alias git='hub'
alias gs='git status'
alias gl='git ll'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gitflow='git commit -a && git push'
alias gb='git branch'
alias gch='git checkout'

# colored man pages ----------------------------------------------------------

man() {
    env \
            LESS_TERMCAP_mb=$(printf "\e[1;37m") \
            LESS_TERMCAP_md=$(printf "\e[1;37m") \
            LESS_TERMCAP_me=$(printf "\e[0m") \
            LESS_TERMCAP_se=$(printf "\e[0m") \
            LESS_TERMCAP_so=$(printf "\e[1;47;30m") \
            LESS_TERMCAP_ue=$(printf "\e[0m") \
            LESS_TERMCAP_us=$(printf "\e[0;36m") \
                    man "$@"
}

# tab completion -------------------------------------------------------------

complete -cf sudo
complete -cf man
complete -cf start
complete -cf stop
complete -cf restart
complete -cf reload
complete -cf spawn

# bash history ---------------------------------------------------------------

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

# nvm ------------------------------------------------------------------------

export NVM_DIR="/Users/dtr/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# gooee ----------------------------------------------------------------------

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# docker

function board () {
    docker exec -it "$1" bash
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
