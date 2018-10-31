TITLE=$(get_ultra_rule_str ' RTFMP ' 0 0)
ULTRANAME=$(get_ultra_rule_str " ✿ ULTRA $(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') ✿ " 0 0)
RULE=$(get_ultra_rule_str '' 0 0) 
FMNO=$(get_ultra_rule_str ' ✿ ' 0 0) 

function ultra_prompt () {
  TITLE=$(get_ultra_rule_str ' ALWAYS RTFMP ')
  ULTRANAME=$(get_ultra_rule_str " ULTRA $(whoami | sed 's/\.[a-z]*$//' | awk '{print toupper($0)}') ")
  RULE=$(get_ultra_rule_str '') 
  FMNO=$(get_ultra_rule_str ' ✿ ') 

  echo " "
  echo "██╗   ██╗██╗  ████████╗██████╗  █████╗  $TITLE"
  echo "██║   ██║██║  ╚══██╔══╝██╔══██╗██╔══██╗ $RULE"
  echo "██║   ██║██║     ██║   ██████╔╝███████║ $FMNO"
  echo "██║   ██║██║     ██║   ██╔══██╗██╔══██║ $RULE"
  echo "╚██████╔╝███████╗██║   ██║  ██║██║  ██║ $ULTRANAME"
  echo " ╚═════╝ ╚══════╝╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ $RULE"
}
. /etc/bash_completion.d/git-prompt

echo "$ULTRANAME"
echo "$TITLE"
echo "$RULE"
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)

if [ $FAST_MACHINE ]
then
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1
PROMPT_COMMAND='__git_ps1 "⦿ (\[\e[1;32m\]`basename \"$VIRTUAL_ENV\"`\[\e[0m\])[\W]" "\[\e[1;32m\]--❯ \[\e[0m\]"'
else
  export PS1="⦿ \H[\W](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) --❯ "
fi
