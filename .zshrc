zmodload zsh/zprof
# https://stackoverflow.com/questions/50168647/multiprocessing-causes-python-to-crash-and-gives-an-error-may-have-been-in-progr
# export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# export PYTHONSTARTUP=~/.pythonstartup
# export PYTHONBREAKPOINT=ipdb.set_trace
# export PIP_REQUIRE_VIRTUALENV=true

HISTSIZE=500000
SAVEHIST=$HISTSIZE

alias swift="swift repl"

alias today="date +%F | pbcopy && echo '$(pbpaste)'"

alias brewup="brew update && brew upgrade && brew cleanup"

alias storage="diskutil info / | grep 'Container' | awk '/Free Space/ {free=\$4; unit=\$5} /Total Space/ {total=\$4} END {print free, unit, \"of\", total, unit, \"free\"}'"

alias fsize="du -sh"
alias fsizeall="du -h"

alias count='\wc -l | awk "{print \$1}"'

# path
alias vscode-snippets="/Users/minho/Library/Application\ Support/Code/User/snippets"
alias repo="cd /Users/minho/code/repo/"

# return and earn: woolworths-marsfield
alias return-and-earn-update-db='(cd /Users/minho/code/python/return-and-earn && activate && python3 main.py)'

# alias myhistory="node /Users/minho/code/nodejs/history-search-ink/dist/cli.js"
alias myhistory="(cd /Users/minho/code/python/history-search-textual && source .venv/bin/activate && python3 main.py)"
alias heic-converter="node /Users/minho/code/nodejs/heic-conveter-js/index.js -f "
# curl0: run curl with local redis cache
# alias curl0="node /Users/minho/code/nodejs/curl-with-redis-cache/index.js"

alias sqlite=sqlite3
# alias python=python3

alias uuid="python3 -m uuid"
# alias uuid='python3 -c "import uuid; print(uuid.uuid4())"'
# alias cal="gcal --starting-day=1"

# apple calendar
alias acal='$(find ~/Library/Developer/Xcode/DerivedData -name "CalendarCLI" -type f -path "*/Build/Products/Debug/*" -print -quit)'

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

# alias mongo="/Users/minho/mongodb/bin/mongo"
# alias mongod="/Users/minho/mongodb/bin/mongod --dbpath=/Users/minho/mongodb-data"

alias mongostart="brew services start mongodb-community"
alias mongostop="brew services stop mongodb-community"

alias ip="echo -n 'router: '; netstat -nr | grep 'default' | grep 'en0' | awk '{print \$2}'; 
echo -n 'local: '; ifconfig en0 | grep netmask | awk '{print \$2}'; 
echo -n 'public: '; curl -s https://icanhazip.com --connect-timeout 5"

# alias activate="source .venv/bin/activate"
function activate() {
  if [ -d ".venv" ]; then
    source .venv/bin/activate
  else
    : # ignore no .venv
  fi
}
alias createvenv-with-pip="python3 -m venv .venv && source .venv/bin/activate && pip install --upgrade pip"
alias pip="pip3"
alias createvenv="uv venv && source .venv/bin/activate && touch requirements.in"
alias uvinstall="uv pip install -r requirements.in && uv pip compile requirements.in -o requirements.txt"
# alias uvcompile="uv pip compile requirements.in -o requirements.txt"

# mac
alias chrome="open -a 'google chrome' "

# docker-compose
alias dcup="docker-compose up"
alias dcupbuild="docker-compose up --build"
alias dcbuild="docker-compose build"
alias dcdown="docker-compose down"

# docker-compose django alias
alias dcrunserver='docker-compose run --rm app sh -c "python3 manage.py runserver"'
alias dcmakemigrations='docker-compose run --rm app sh -c "python3 manage.py makemigrations"'
alias dcmigrate='docker-compose run --rm app sh -c "python3 manage.py migrate"'
alias dcshell='docker-compose run --rm app sh -c "python3 manage.py shell"'
alias dccollectstatic='docker-compose run --rm app sh -c "python3 manage.py collectstatic"'
alias dctest='docker-compose run --rm app sh -c "python3 manage.py test"'

# django alias
alias runserver="python3 manage.py runserver"
alias makemigrations="python3 manage.py makemigrations"
alias migrate="python3 manage.py migrate"
alias shell="python3 manage.py shell"
alias shellplus="python3 manage.py shell_plus"
# alias shellplus="python3 manage.py shell_plus --ipython"
alias collectstatic="python3 manage.py collectstatic"

# django project alias
alias runserver-abbr="(cd /Users/minho/code/django/abbr && activate && code . && chrome http://localhost:8000/ && runserver)"

# django settings
# export DJANGO_SETTINGS_MODULE=settings.local
export CHROME_DRIVER_PATH="/Users/minho/code/chromedriver"

alias desktop="cd /Users/minho/Desktop"

# npm
alias dev="npm run dev"
alias start="npm run start"
alias test="npm run test"

# open projects, vscode
alias diary="cd /Users/minho/diary"
alias blog="cd /Users/minho/code/react/blog"
alias zshrc="code ~/.zshrc"
alias synczshrc="(cd /Users/minho/code/dotfiles && cp ~/.zshrc .zshrc && git add . && git commit -m 'update zshrc' && git push)"

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
# ZSH_THEME="agnoster"
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

# pnpm
# pnpm endcommand -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PNPM_HOME="/Users/minho/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "/Users/minho/.bun/_bun" ] && source "/Users/minho/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# zig
export PATH=$PATH:/usr/local/zig
# docker
# export PATH=$PATH:/Applications/Docker.app/Contents/Resources/bin

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

function curl2() {
  curl -s "$1" | jq "." 2>/dev/null || curl -s "$1"
}

alias zsource="source ~/.zshrc"
# F5 to reload zsh
bindkey -s "^[[15~" "source ~/.zshrc\n"

# prevent django-rq error
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias pywatch="ls *.py | entr -r python3 "

alias aos="python3 solution.py < in.txt"
alias aot="python3 solution.py < test.txt"
alias aoc="aot; echo; aos"

alias leetcode="cd /Users/minho/code/coding-interview-prep/leetcode"
# alias pwd="pwd | pbcopy"

alias tree1="tree -L 1"
alias tree2="tree -L 2 -I node_modules"
alias tree3="tree -L 3 -I node_modules"

# ggrep color for --color
# 01;: bold, 32: green, 33: yellow
# export GREP_COLORS='mt=33'

# this alias doesn't work on the top of the file: ls, grep,
# https://www.rapidtables.com/code/linux/ls.html
alias grep="ggrep -in --color "

alias f="find . -maxdepth 2 -name "
