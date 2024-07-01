# Shell prompt.
PROMPT='%K{white}%F{black}%~$%f%k '

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="/Users/eric/.local/bin:$PATH"export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Created by `pipx` on 2023-11-03 21:00:08
export PATH="$PATH:/Users/eric/.local/bin"

# --- Aliases ---

# --- General aliases ---

alias lsa="ls -alh"

# --- Git aliases
alias gits="git status"
alias gd="git diff"
alias gitlog="git log --oneline"

# git diff, using difftastic
alias gdd="git difftool"

# gpo main, gpo dev_branch
alias gpo="git push origin"

# gcam "My commit message"
alias gcam="git commit -am"


# --- Other/third-party aliases ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
