_segment() { printf '\[\e[38;5;%sm\]%s\[\e[0m\]' "$1" "$2"; }

set_prompt() {
  PS1="$(_segment 245 "$SHELL") $(_segment 215 '\u') $(_segment 109 '\w') ❯ "
}
