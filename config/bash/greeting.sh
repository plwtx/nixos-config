_color() { printf '\e[38;5;%sm%s\e[0m' "$1" "$2"; }

_plural() { 
  (( $1 == 1 )) && printf '%d %s' "$1" "$2" || printf '%d %ss' "$1" "$2"
}

_time_now() {
  local t
  t=$(date +"%-I:%M%p")
  printf '%s' "${t,,}"
}

_uptime() {
  local secs
  read -r secs _ < /proc/uptime
  secs=${secs%.*}

  printf '%s, %s, %s' \
    "$(_plural $((secs / 86400)) day)" \
    "$(_plural $((secs % 86400 / 3600)) hour)" \
    "$(_plural $((secs % 3600 / 60)) minute)"
}

_kernel() { uname -r; }

greeting() {
  printf "%s %s  %s  %s\n\n" \
    "$(_color 245 " > ^. .^ < ꠹ | ")" \ # you need some cuteness in your life
    "$(_color 215 "$(_time_now)")" \
    "$(_color 180 "$(_uptime)")" \
    "$(_color 109 "$(_kernel)")"
}
