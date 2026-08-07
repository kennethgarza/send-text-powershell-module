#!/bin/zsh

set -euo pipefail

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 \"Text to send\" [seconds]"
  exit 1
fi

text="$1"
seconds="${2:-5}"

if ! [[ "$seconds" == <-> ]]; then
  echo "Error: seconds must be a non-negative integer."
  exit 1
fi

countdown="$seconds"
while (( countdown > 0 )); do
  echo "Sending Text in ${countdown} seconds"
  (( countdown-- ))
  sleep 1
done

echo -n "Sending Text"

osascript - "$text" <<'APPLESCRIPT'
on run argv
  tell application "System Events"
    keystroke (item 1 of argv)
  end tell
end run
APPLESCRIPT

echo "... done"
