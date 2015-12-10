# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

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
plugins=(git ruby github git-remote-branch vagrant zsh-syntax-highlighting vagrant heroku rails aws)

source $ZSH/oh-my-zsh.sh

# Set general path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/zee/Library/Python/2.7/bin:$PATH

# Append rbenv stuff to path if it exists
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
fi

#options
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
set -o vi
set editing-mode vi
set blink-matching-paren on

#aliases
alias tmux="tmux -2"
alias tns="tmux new -s"
alias ta="tmux attach"
alias tks='tmux kill-session -t'
alias decrypt='gpg -d'
alias 'gi'='gem install --no-ri --no-rdoc --verbose'
alias psp='pry --simple-prompt'
alias vrnp='vagrant reload --no-provision'
alias vunp='vagrant up --no-provision'
alias vs='vagrant status'
alias vu='vagrant up'
alias vuvb='vagrant up --provider=virtualbox'
alias untar='tar xvf'
alias vssh='vagrant ssh'
alias fixvbox='sudo /Library/StartupItems/VirtualBox/VirtualBox restart'
alias vsr='vs |grep running'
alias vbs='vagrant suspend'
alias vbr='vagrant resume'
alias ccat='pygmentize -g'
alias rlibmodule='export RUBYLIB="$(pwd)"/lib:$RUBYLIB'
alias serverme='mosh --server=/usr/bin/mosh-server serverbot'
alias be='bundle exec'

#vars
export HOMEBREW_GITHUB_API_TOKEN=d53e5f0eecea6ae32f1d5198fbfc13399298b7a8
export EDITOR='vim'
export VAGRANT_DEFAULT_PROVIDER=virtualbox

if [ -f /usr/local/opt/curl-ca-bundle/share/ca-bundle.crt ]; then
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
fi

if [ -f /usr/local/bin/gsed ]; then
  alias fixlogs='gsed -r -i.bak "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
fi

# ruby -ryaml -e "YAML.load_file 'tst.yaml'"
validateyaml() {
  ruby -ryaml -rpuppet -e "YAML.load_file '$1'"
}

decryptfile() {
  gpg --decrypt $1 > $1.tar.gz
}


alias vgems='GEM_HOME=~/.vagrant.d/gems /Applications/Vagrant/embedded/bin/gem list'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

set -o vi
alias crontab="VIM_CRONTAB=true crontab"
export WINEARCH=win32

if [ -e /home/zee/.local/bin/powerline-config ]; then
  export POWERLINE_CONFIG_COMMAND='/home/zee/.local/bin/powerline-config'
fi
