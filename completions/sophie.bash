_sophie() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(sophie commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(sophie completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _sophie sophie
