if [[ ! -o interactive ]]; then
    return
fi

compctl -K _sophie sophie

_sophie() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(sophie commands)"
  else
    completions="$(sophie completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
