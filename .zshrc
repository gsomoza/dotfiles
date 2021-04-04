# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

MAGIC_ENTER_OTHER_COMMAND='exa -laF --icons --git --group-directories-first'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

### zinit custom
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit wait lucid for \
  light-mode atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  light-mode atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  light-mode blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \
  t413/zsh-background-notify \
  zdharma/history-search-multi-word
zinit wait"1" lucid from"gh-r" as"null" for \
     sbin"fzf"             junegunn/fzf \
     sbin"**/fd"           @sharkdp/fd \
     sbin"**/bat"          @sharkdp/bat \
     sbin"exa* -> exa"     ogham/exa \
     sbin"stern* -> stern" wercker/stern

zinit snippet OMZP::ansible
zinit snippet OMZP::command-not-found
zinit snippet OMZP::docker-compose
zinit snippet OMZP::git
zinit snippet OMZP::gpg-agent
zinit snippet OMZP::magic-enter
zinit snippet OMZP::safe-paste
### End zinit custom

alias ll='exa -laF --icons --git --group-directories-first'
export PATH="${HOME}/bin:/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gabriel/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gabriel/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gabriel/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gabriel/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
