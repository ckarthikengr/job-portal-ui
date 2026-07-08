#!/usr/bin/env bash
# Claude Code status line: model name + context usage progress bar
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

bar=""
if [ -n "$used" ]; then
  pct=$(printf "%.0f" "$used")
  filled=$(( pct / 5 ))
  [ "$filled" -gt 20 ] && filled=20
  empty=$(( 20 - filled ))
  bar=$(printf '%*s' "$filled" '' | tr ' ' '#')
  bar="$bar$(printf '%*s' "$empty" '' | tr ' ' '-')"

  if [ "$pct" -lt 50 ]; then
    color="\033[32m"   # green
  elif [ "$pct" -lt 80 ]; then
    color="\033[33m"   # yellow
  else
    color="\033[31m"   # red
  fi

  ctx_display="${color}[$bar] ${pct}%\033[0m"
else
  ctx_display="\033[2m[--------------------] n/a\033[0m"
fi

printf '\033[2m%s\033[0m | %b' "$model" "$ctx_display"
