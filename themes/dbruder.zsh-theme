# DBR_PROMPT

DBR_PROMPT_BRACKET_COLOR="%{$fg[white]%}"
DBR_PROMPT_TIME_COLOR="%{$fg[yellow]%}"
DBR_PROMPT_RVM_COLOR="%{$fg[magenta]%}"
DBR_PROMPT_DIR_COLOR="%{$fg[cyan]%}"
DBR_PROMPT_GIT_BRANCH_COLOR="%{$fg[green]%}"
DBR_PROMPT_GIT_CLEAN_COLOR="%{$fg[green]%}"
DBR_PROMPT_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="%{$DBR_PROMPT_BRACKET_COLOR%}:%{$DBR_PROMPT_GIT_BRANCH_COLOR%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$DBR_PROMPT_GIT_CLEAN_COLOR%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$DBR_PROMPT_GIT_DIRTY_COLOR%}✗"

# Our elements:
DBR_PROMPT_TIME_="%{$DBR_PROMPT_BRACKET_COLOR%}{%{$DBR_PROMPT_TIME_COLOR%}%T%{$DBR_PROMPT_BRACKET_COLOR%}}%{$reset_color%}"
DBR_PROMPT_RVM_="%{$DBR_PROMPT_BRACKET_COLOR%}"["%{$DBR_PROMPT_RVM_COLOR%}\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}%{$DBR_PROMPT_BRACKET_COLOR%}"]"%{$reset_color%}"
DBR_PROMPT_PERL_VERSION_="%{$DBR_PROMPT_BRACKET_COLOR%}"["%{$DBR_PROMPT_RVM_COLOR%}`perl --version | perl -ne 'print $1 if /(v\d.\d+.\d+)/'`%{$DBR_PROMPT_BRACKET_COLOR%}"]"%{$reset_color%}"
DBR_PROMPT_DIR_="%{$DBR_PROMPT_DIR_COLOR%}%~\$(git_prompt_info) "
DBR_PROMPT_PROMPT="%{$DBR_PROMPT_BRACKET_COLOR%}➭ "
DBR_PROMPT_HISTORY_="%{$fg[green]%}%!%{$reset_color%}"
# DBR_PROMPT_USER_HOST_="%{$fg_bold[yellow]%}%n%{$fg[green]%}@%{$fg_bold[yellow]%}%m%{$reset_color%}"
DBR_PROMPT_USER_HOST_="%{$fg[blue]%}%m%{$reset_color%}"

# Put it all together!

PROMPT="[$DBR_PROMPT_HISTORY_] $DBR_PROMPT_DIR_$DBR_PROMPT_PROMPT%{$reset_color%}"
RPROMPT={$DBR_PROMPT_USER_HOST_}$DBR_PROMPT_PERL_VERSION_$DBR_PROMPT_TIME_


### BONUS TRACK
# screenz() {
#     if [[ $TERM == "screen" ]]; then
#         echo -n $TERM
#         return
#     else
#         echo -n ${$(screen -list|grep -i '^[0-9] socket'|cut -c1):-0} scre
#         return
#     fi
# }
# eval DBR_SHELL=\$([[ $TERM == "screen" ]] && \$(echo -n $TERM) || \$("echo -n \${\$(screen -list|grep -i '^[0-9] socket'|cut -c1):-0} scre)")
# RPROMPT='[$DBR_SHELL]$RPROMPT'
# RPROMPT=[`screenz`]$RPROMPT
