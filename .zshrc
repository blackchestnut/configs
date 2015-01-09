# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export NODE_PATH=/usr/local/lib/node_modules

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby bundler capistrano gem osx zeus rvm ssh-agent rake brew command-not-found compleat composer cp history history-substring-search git-remote-branch git git-flow git-extras github pow)

HISTSIZE=100000
HISTFILESIZE=200000
TERM="xterm-256color"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/share/npm/bin
#export CC=clang

# My projects
alias news="cd ~/projects/news25km"
alias mybudget="cd ~/projects/mybudget"
alias my=mybudget
alias shi="cd ~/projects/shikimori.org/shikimori"
alias vi="cd ~/projects/vimocean"
cd_projects() {
  cd ~/projects/$1
}
alias pr=cd_projects

# Git
alias g='git status'
alias gd='git diff head --color'
alias finalize='git rebase --interactive --autosquash develop'
#alias gl='git log --pretty=format:"%Cred%h%Creset %ad | %s%d [%an]" --graph --date=short'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s - %C(bold blue)%an%Creset, %Cgreen%cr' --abbrev-commit"
alias gput="git push origin HEAD"
alias gu="git-up" # https://github.com/aanand/git-up
git_commit_m() {
  git add -A && git commit -m "$1"
}
alias gcm=git_commit_m

# Rails
alias r='rails'
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias rollback='rake db:rollback && rake db:rollback RAILS_ENV=test'
alias deploy='cap deploy'
alias pdeploy='cap production deploy'
alias linode='ssh deploy@mybudget.ws'

fpath=(path/to/zsh-completions/src $fpath)
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

alias psf='ps aux|grep $1'
alias ll='ls -la'
alias l='ls -a'
alias files='find . -maxdepth 1 -type f | wc -l'

myfind() {
  find . -type f \( -name "*.rb" -or -name "*.erb" -or -name "*.rss" -or -name "*.xml" -or -name "*.slim" -or -name "*.haml" -or -name "*.js" -or -name "*.coffee" -or -name "*.ejs" -or -name "*.jst" -or -name "*.eco" -or -name "*.css" -or -name "*.scss" -or -name "*.yml" -or -name "*.vim" -or -name "*.rabl" -or -name "*.builder"  -or -name "*.txt" \)  -exec grep -l "$1" {} \;
}
alias f=myfind
#alias fvim="mvim \`myfind $1\`"

fgrep_rails_proj() {
  fgrep -i -r $1 **/*.{rb,slim,sass,coffee}
}
alias ff=fgrep_rails_proj

port_lock() {
  lsof -i tcp:$1
}
alias plock=port_lock

rvm use default
#EDITOR=/usr/local/Cellar/macvim/7.3-65/MacVim.app/Contents/MacOS/MacVim
export PATH=/usr/local/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/go # Go Workspaces
