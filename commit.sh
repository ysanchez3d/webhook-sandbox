#!/usr/bin/env bash
# Make N test commits and push them, triggering a GitHub webhook delivery.
# Usage: ./commit.sh [count]   (default 1)
set -euo pipefail
cd "$(dirname "$0")"

count="${1:-1}"

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "no 'origin' remote set. Add it first:" >&2
  echo "  git remote add origin git@github.com:<you>/webhook-sandbox.git" >&2
  exit 1
fi

for i in $(seq 1 "$count"); do
  stamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf '%s  test event %s/%s\n' "$stamp" "$i" "$count" >> log.txt
  git add log.txt
  git commit -q -m "test event $stamp ($i/$count)"
done

git push -q origin main
echo "pushed $count commit(s) to origin/main"
