#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")/.."

name="${1:-}"
tpl="${2:-note}"

if [[ -z "$name" ]]; then
  echo "usage: scripts/new.sh <name> [template]" >&2
  echo "templates:" >&2
  ls templates/*.typ 2>/dev/null | sed 's#templates/##;s#\.typ##;s/^/  /' >&2
  exit 1
fi

src="src/${name}.typ"
tplfile="templates/${tpl}.typ"

[[ -f "$tplfile" ]] || { echo "no template: $tplfile" >&2; exit 1; }
[[ -e "$src" ]] && { echo "exists: $src" >&2; exit 1; }

mkdir -p "$(dirname "$src")"
cp "$tplfile" "$src"
echo "created $src"
