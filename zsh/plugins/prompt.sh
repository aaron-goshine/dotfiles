# Function to print centered text within a title line of width 80
get_ultra_rule_str() {
  local text="$1"
  local line_width=$COLUMNS
  local text_width=${#text}
  local padding=$((line_width - text_width))
  local left_padding=$((padding / 2))
  local right_padding=$((padding - left_padding))

  # Create a left pad of tilde (~)
  for ((i = 0; i < left_padding; i++)); do
    printf "~"
  done

  # Print the text
  printf "%s" "$text"

  # Create a right pad of tilde (~)
  for ((i = 0; i < right_padding; i++)); do
    printf "~"
  done

  echo
}

# Function to set ultra prompt
ultra_prompt() {
  local TITLE=$(get_ultra_rule_str ' ALWAYS RTFMP ')
  local ULTRANAME=$(get_ultra_rule_str " EXTRAORDINARY $(id -un | awk '{print toupper($0)}') ")
  local RULE=$(get_ultra_rule_str '~')
  local FMNO=$(get_ultra_rule_str ' ✿ ')

  echo "\nYour fancy ASCII art here..."
}

# Initialize variables and print them
TITLE=$(get_ultra_rule_str ' RTFMP ')
ULTRANAME=$(get_ultra_rule_str " EXTRAORDINARY $(id -un | awk '{print toupper($0)}') ")
RULE=$(get_ultra_rule_str '~')
FMNO=$(get_ultra_rule_str ' ✿ ')
IMO=$(get_ultra_rule_str 'm a hlthy, wlthy ldr, sklld nd nsghtfl, nrchng my wrld.')
echo "$ULTRANAME"
echo "$TITLE"
echo "$IMO"
echo "$FMNO"

# Profile-based prompt customization
# Add this function to your .zshrc
git_branch_prompt() {
  local branch
  if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
    if [[ $(git status --short 2> /dev/null | wc -l) -gt 0 ]]; then
      # Branch is dirty
      echo "%F{yellow}${branch}*%f"
    else
      # Branch is clean
      echo "%F{green}${branch}%f"
    fi
  fi
}

# Add this to your existing PROMPT setting
PROMPT='%F{cyan}%1~ $(git_branch_prompt) %F{none}--❯ '
