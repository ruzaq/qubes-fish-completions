#!/bin/bash
# Run in dom0. Collects --help of the qvm-* tools for tools/gen-options.py
# and sends it to the VM with this repo.
# Usage: bash dump-help.sh [appvm-name]
# --help is run only for Python tools from qubesadmin.tools; shell scripts
# are not executed at all.
set -eu
VM="${1:-ai-anthropic}"
OUT=/tmp/qh
rm -rf "$OUT" /tmp/qh.tar
mkdir -p "$OUT"
for c in $(grep -l 'qubesadmin.tools' /usr/bin/qvm-* /usr/bin/qubes-prefs 2>/dev/null); do
    "$c" --help 2>&1 | sed "s#$HOME/#~/#g" > "$OUT/$(basename "$c").txt" || true
done
ls /usr/bin/qvm-* /usr/bin/qubes-* > "$OUT/_commands.txt"
rpm -q qubes-core-admin-client fish > "$OUT/_versions.txt"
tar -C /tmp -cf /tmp/qh.tar qh
qvm-copy-to-vm "$VM" /tmp/qh.tar
