#!/bin/bash
# Run this script FROM DOM0 to install QubesOS fish completions.
# Usage: bash install-from-dom0.sh [appvm-name]
# Default appvm: ai-anthropic

set -e

VM="${1:-ai-anthropic}"
SRC="/home/user/claude-dom0-fish"
FISH_COMP="$HOME/.config/fish/completions"
FISH_FUNC="$HOME/.config/fish/functions"

mkdir -p "$FISH_COMP" "$FISH_FUNC"

completions=(
    qubes-prefs
    qvm-appmenus
    qvm-backup
    qvm-backup-restore
    qvm-block
    qvm-check
    qvm-clone
    qvm-console
    qvm-console-dispvm
    qvm-copy
    qvm-copy-to-vm
    qvm-create
    qvm-device
    qvm-features
    qvm-firewall
    qvm-get-image
    qvm-get-tinted-image
    qvm-kill
    qvm-ls
    qvm-move
    qvm-move-to-vm
    qvm-notes
    qvm-pause
    qvm-pci
    qvm-pool
    qvm-prefs
    qvm-remove
    qvm-run
    qvm-service
    qvm-shutdown
    qvm-start
    qvm-start-daemon
    qvm-start-gui
    qvm-sync-appmenus
    qvm-sync-clock
    qvm-tags
    qvm-template
    qvm-template-postprocess
    qvm-unpause
    qvm-usb
    qvm-volume
    qvm-xkill
)

functions=(
    __qvm_backup_profiles
    __qvm_block_ids
    __qvm_count_pos_args
    __qvm_device_ids
    __qvm_halted_vms
    __qvm_installed_templates
    __qvm_paused_vms
    __qvm_pci_ids
    __qvm_pools
    __qvm_running_vms
    __qvm_usb_ids
    __qvm_vms
)

echo "Installing QubesOS fish completions from VM: $VM"
echo ""

for name in "${completions[@]}"; do
    echo "  completions/${name}.fish"
    qvm-run --pass-io "$VM" "cat ${SRC}/completions/${name}.fish" \
        > "${FISH_COMP}/${name}.fish"
done

echo ""

for name in "${functions[@]}"; do
    echo "  functions/${name}.fish"
    qvm-run --pass-io "$VM" "cat ${SRC}/functions/${name}.fish" \
        > "${FISH_FUNC}/${name}.fish"
done

echo ""
echo "Done. Reload completions with:"
echo "  fish -c 'source ~/.config/fish/config.fish'"
echo "Or restart your fish shell."
