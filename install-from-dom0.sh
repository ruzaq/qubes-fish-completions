#!/bin/bash
# Run this script FROM DOM0 to install QubesOS fish completions.
# Usage: bash install-from-dom0.sh [appvm-name]
# Default appvm: ai-anthropic

set -euo pipefail

VM="${1:-ai-anthropic}"
SRC="/home/user/claude-dom0-fish"
FISH_COMP="$HOME/.config/fish/completions"
FISH_FUNC="$HOME/.config/fish/functions"

mkdir -p "$FISH_COMP" "$FISH_FUNC"

echo "Installing QubesOS fish completions from VM: $VM"

# The file list comes from the VM, so every name is checked before it is
# used as a path in dom0.
mapfile -t files < <(qvm-run --pass-io "$VM" \
    "cd ${SRC} && ls completions/*.fish functions/*.fish")
for f in "${files[@]}"; do
    if [[ ! $f =~ ^(completions|functions)/[A-Za-z0-9_.-]+\.fish$ ]]; then
        echo "Refusing unexpected file name: $f" >&2
        exit 1
    fi
done

for f in "${files[@]}"; do
    case $f in
        completions/*) dest="$FISH_COMP/${f#completions/}" ;;
        functions/*) dest="$FISH_FUNC/${f#functions/}" ;;
    esac
    echo "  $f"
    qvm-run --pass-io "$VM" "cat ${SRC}/$f" > "$dest"
done

echo ""
echo "Installed ${#files[@]} files. Restart fish (exec fish) to load them."
