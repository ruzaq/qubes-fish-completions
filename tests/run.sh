#!/bin/bash
# Runs the completions in fish against stubbed qvm-* commands.
# Usage: bash tests/run.sh
#
# PATH holds only the stubs: a completion that would call a real command
# (or a mutating qvm-* one) hits the stub's UNEXPECTED branch and the test
# fails, nothing on the host is touched.
set -u
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FISH="$(command -v fish)"
SANDBOX="$(mktemp -d)"
trap 'rm -rf "$SANDBOX"' EXIT
mkdir -p "$SANDBOX/bin" "$SANDBOX/home"
# Fish loads completions only for commands it can find, so every completed
# command needs a stub. Only the read-only ones answer, the rest log UNEXPECTED.
for f in "$ROOT"/completions/*.fish; do
    c=${f##*/}; ln -s "$ROOT/tests/stub-qvm" "$SANDBOX/bin/${c%.fish}"
done
export STUB_LOG="$SANDBOX/calls.log"
: > "$STUB_LOG"
fails=0

# complete <cmdline> -> candidate names (descriptions stripped)
comp() {
    env -i HOME="$SANDBOX/home" PATH="$SANDBOX/bin" STUB_LOG="$STUB_LOG" \
        XDG_CONFIG_HOME="$SANDBOX/home/.config" XDG_DATA_HOME="$SANDBOX/home/.local/share" \
        "$FISH" --no-config -c "
            set -p fish_function_path $ROOT/functions
            set -p fish_complete_path $ROOT/completions
            complete -C '$1'" 2>&1 | cut -f1 | sort | tr '\n' ' '
}

# expect <cmdline> <why> <must contain...> [-- <must not contain...>]
expect() {
    local line=$1 why=$2; shift 2
    local got; got=" $(comp "$line")"
    local mode=in
    for w in "$@"; do
        if [[ $w == -- ]]; then mode=out; continue; fi
        if [[ $mode == in && $got != *" $w "* ]] || [[ $mode == out && $got == *" $w "* ]]; then
            echo "FAIL: '$line' ($why): expected $mode '$w', got:$got"
            fails=$((fails + 1))
            return
        fi
    done
    echo "ok:   '$line'"
}

expect 'qvm-start ' 'qvm-start offers only halted qubes' personal debian-13 -- work dom0
expect 'qvm-shutdown ' 'qvm-shutdown offers only running qubes' work sys-net -- personal
expect 'qvm-unpause ' 'qvm-unpause offers only paused qubes' disp1 -- work
expect 'qvm-run -u root ' 'value of -u must not count as the qube name' work personal
expect 'qvm-run -u ' 'value of -u' root user
expect 'qvm-run work ' 'after the qube name comes the command, no qube names' -- work personal
expect 'qvm-run --dispvm=debian-13 ' 'with --dispvm there is no qube name' -- work
expect 'qvm-run --' 'options come from qvm-run --help of 4.3' --no-shell --all --exclude -- --exec --auto-start
expect 'qvm-prefs ' 'first argument is the qube' work personal
expect 'qvm-prefs work ' 'properties are read from the qube' autostart label netvm template ip
expect 'qvm-prefs work netvm ' 'netvm takes a qube' sys-net work
expect 'qvm-prefs work autostart ' 'boolean detected from the current value' True False
expect 'qvm-prefs work label ' 'label colours' red black
expect 'qvm-prefs -D work ' 'flag before the qube does not shift positions' autostart netvm
expect 'qubes-prefs ' 'global properties' check_updates_vm default_netvm
expect 'qubes-prefs default_netvm ' 'default_netvm takes a qube' sys-net
expect 'qvm-features work ' 'features set on the qube plus common ones' gui preload-dispvm-max
expect 'qvm-service work ' 'services set on the qube' cups
expect 'qvm-service work cups ' 'service value' on off
expect 'qvm-tags work ' 'subcommands from --help' list add del
expect 'qvm-tags work del ' 'tags of that qube' ansible-managed created-by-dom0
expect 'qvm-device ' 'device classes come from qvm-device' block usb pci mic
expect 'qvm-device usb ' 'subcommands' list attach detach assign unassign info
expect 'qvm-device usb attach ' 'qube to attach to' work personal
expect 'qvm-device usb attach work ' 'device ids, header skipped' sys-usb:2-1 -- BACKEND:DEVID
expect 'qvm-template ' 'template subcommands from 4.3 --help' install list remove upgrade
expect 'qvm-template remove ' 'installed templates only' debian-13 -- work
expect 'qvm-volume info ' 'VM:VOLUME pairs' work:private debian-13:root
expect 'qvm-ls --fields ' 'qvm-ls fields' name state
expect 'qvm-pool --info ' 'pool names, header skipped' varlibqubes vm-pool -- NAME
expect 'qvm-backup --exclude ' 'exclude takes a qube' work

if grep -q UNEXPECTED "$STUB_LOG"; then
    echo "FAIL: completions called commands the stub does not know:"
    grep UNEXPECTED "$STUB_LOG" | sort -u
    fails=$((fails + 1))
fi
echo "calls to qvm-*: $(wc -l < "$STUB_LOG")"
if ((fails)); then echo "FAILED: $fails"; exit 1; fi
echo "PASS"
