#!/usr/bin/env zsh

PROMPT_PATH_MAX_LENGTH=30
PROMPT_DEFAULT_END=❯
PROMPT_ROOT_END=❯❯❯
PROMPT_SUCCESS_COLOR=$fg[blue]
PROMPT_FAILURE_COLOR=$fg[red]
PROMPT_VCS_INFO_COLOR=$FG[242]

setopt promptsubst

autoload -U add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "%S" "%r/%s/%b %u%c (%a)"
zstyle ':vcs_info:*:*' formats "%S" "%r/%s/%b %u%c"
zstyle ':vcs_info:*:*' nvcsformats "%~" ""

PROMPT="%(0?.%{$PROMPT_SUCCESS_COLOR%}.%{$PROMPT_FAILURE_COLOR%})${SSH_TTY:+[%n@%m]}%{$FX[bold]%}%$PROMPT_PATH_MAX_LENGTH<..<"'${vcs_info_msg_0_%%.}'"%<<%(!.$PROMPT_ROOT_END.$PROMPT_DEFAULT_END)%{$FX[no-bold]%}%{$FX[reset]%} "
RPROMPT="%{$PROMPT_VCS_INFO_COLOR%}"'$vcs_info_msg_1_'"%{$FX[reset]%}"
