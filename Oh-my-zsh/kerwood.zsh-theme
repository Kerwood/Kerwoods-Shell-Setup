# Kerwood @ LinuxBloggen.dk

local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
local path_p="${blue_op}%~${blue_cp}"
local host="${blue_op}%{$fg_bold[cyan]%}%m%{$reset_color%}${blue_cp}"
local user="${blue_op}%{$fg_bold[cyan]%}%n%{$reset_color%}${blue_cp}"
local arrow="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$reset_color%}"

PROMPT='╭─${host}─${user}─${path_p} %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}
╰─ ${arrow}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
