zmodload zsh/zprof
# https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PYTHONSTARTUP=~/.pythonstartup
# export PYTHONBREAKPOINT=ipdb.set_trace
# export PIP_REQUIRE_VIRTUALENV=true

HISTSIZE=500000
SAVEHIST=$HISTSIZE

alias count='\wc -l | awk "{print \$1}"'

# path
alias vscode-snippets="/Users/minho/Library/Application\ Support/Code/User/snippets"
alias repo="cd /Users/minho/code/repo/"

# alias myhistory="node /Users/minho/code/nodejs/history-search-ink/dist/cli.js"
alias myhistory="cd /Users/minho/code/python/history-search-textual && source .venv/bin/activate && python main.py"
alias heic-converter="node /Users/minho/code/nodejs/heic-conveter-js/index.js -f "

alias sqlite=sqlite3
alias python=python3

alias uuid='python3 -c "import uuid; print(uuid.uuid4())"'
# alias cal="gcal --starting-day=1"

# ccal for typo
alias ccal="cal"

function cal() {
  if command -v gcal >/dev/null 2>&1; then
    gcal --starting-day=1 "$@"
  else
    command cal
  fi
}
alias psql="psql -U postgres"
alias suggestpassword="openssl rand -base64 15 | pbcopy | echo 'Password copied'"
alias cloudflaredtunnel="cloudflared tunnel --url http://localhost:3000"

alias ld='if [ "$(find . -maxdepth 1 -type d ! -path .)" ]; then ls -ld */; fi'
# alias ld="ls -ld */"
alias ld1="ls -1d */"

alias mongo="/Users/minho/mongodb/bin/mongo"
alias mongod="/Users/minho/mongodb/bin/mongod --dbpath=/Users/minho/mongodb-data"

alias ip="curl https://icanhazip.com"
alias whatismyip="curl https://icanhazip.com"
alias ipi="ifconfig en0 | grep netmask | awk '{print \$2}'"
alias ip4="curl http://checkip.amazonaws.com"

# alias activate="source .venv/bin/activate"
function activate() {
  if [ -d ".venv" ]; then
    source .venv/bin/activate
  else
    : # ignore no .venv
  fi
}
alias createvenv="python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip"
alias uvcreatevenv="uv venv && source .venv/bin/activate"
alias pip="pip3"
alias uvinstall="uv pip install -r requirements.in"
alias uvcompile="uv pip compile requirements.in -o requirements.txt"

# mac
alias chrome="open -a 'google chrome' "

# docker-compose
alias dcup="docker-compose up"
alias dcupbuild="docker-compose up --build"
alias dcbuild="docker-compose build"
alias dcdown="docker-compose down"

# docker-compose django alias
alias dcrunserver='docker-compose run --rm app sh -c "python manage.py runserver"'
alias dcmakemigrations='docker-compose run --rm app sh -c "python manage.py makemigrations"'
alias dcmigrate='docker-compose run --rm app sh -c "python manage.py migrate"'
alias dcshell='docker-compose run --rm app sh -c "python manage.py shell"'
alias dccollectstatic='docker-compose run --rm app sh -c "python manage.py collectstatic"'
alias dctest='docker-compose run --rm app sh -c "python manage.py test"'

# django alias
alias runserver="python3 manage.py runserver"
alias makemigrations="python3 manage.py makemigrations"
alias migrate="python3 manage.py migrate"
alias shell="python3 manage.py shell"
alias shellplus="python3 manage.py shell_plus"
# alias shellplus="python3 manage.py shell_plus --ipython"
alias collectstatic="python3 manage.py collectstatic"

# django settings
# export DJANGO_SETTINGS_MODULE=settings.local
export CHROME_DRIVER_PATH="/Users/minho/code/chromedriver"

alias desktop="cd /Users/minho/Desktop"

# npm
alias dev="npm run dev"
alias dev2="npm run dev2"
alias start="npm run start"

# project shortcuts - django
alias contractreader="cd /Users/minho/code/django/contractreader && source .venv/bin/activate"

# open projects, vscode
alias diary="cd /Users/minho/diary && code ."
alias blog="cd /Users/minho/code/react/blog && code ."
alias zshrc="code ~/.zshrc"

# celery
alias celerycontractreader="celery -A contractreader worker -l info -O fair"
alias celeryroster="celery -A project worker -l info -O fair"
alias celerychildcare="celery -A project worker --beat --scheduler django --loglevel=info"

# alias gitconfig="code .git/config"

# alias flower="flower --port=5555"
export CELERY_BROKER_URL="redis://localhost:6379"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/minho/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="refined"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
zstyle ':omz:plugins:nvm' lazy yes
plugins=(
  git
  # you-should-use
  nvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# this alias doesn't work on the top of the file: ls, grep,
# https://www.rapidtables.com/code/linux/ls.html
alias grep="grep -i"

# pnpm
# pnpm endcommand -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PNPM_HOME="/Users/minho/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "/Users/minho/.bun/_bun" ] && source "/Users/minho/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zig
export PATH=$PATH:/usr/local/zig
# docker
# export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

function curl2() {
  curl -s "$1" | jq "."
}

# rust
export PATH=$PATH:~/.cargo/bin

# alias zsource="source ~/.zshrc"
# F5 to reload zsh
bindkey -s "^[[15~" "source ~/.zshrc\n"

# prevent django-rq error
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
