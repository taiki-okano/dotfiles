#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Language setting
export LC_ALL="en_US.UTF-8"

# Settings of Homebrew
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Settings of tmux
export PATH=~/.local/bin:$PATH
export PATH=~/Library/Python/3.9/bin:$PATH

# Settings of pure theme
fpath+=$HOME/.zsh/pure

# Settings of pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Settings of clipboard through X11 forwarding (Linux)
if [[ "$(uname)" == 'Darwin' ]]; then
	:
elif [[ "$(expr substr $(uname -s) 1 5)" = 'Linux' ]]; then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
fi

# Settings of fzf (Require "fd", "fzf", "ripgrep" and "bat")
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setting of docker for zsh completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

	autoload -Uz compinit
	compinit
fi

# Settings of ctrl shortcuts
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey '^K' autosuggest-accept

# Settings of gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taiki_okano/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taiki_okano/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taiki_okano/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taiki_okano/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Settings of z
. /usr/local/etc/profile.d/z.sh

