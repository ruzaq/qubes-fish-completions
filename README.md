# qubes-fish-completions

Fish shell tab completions for [QubesOS](https://www.qubes-os.org/) `qvm-*` commands, intended to be used in dom0.

Covers 40+ commands including `qvm-run`, `qvm-create`, `qvm-ls`, `qvm-prefs`, `qvm-device`, and more.

## Installation

### From dom0 (recommended)

If you develop or edit the completions in an AppVM (e.g. `ai-anthropic`), use the provided install script to copy them into dom0:

```bash
bash install-from-dom0.sh [appvm-name]
# default appvm: ai-anthropic
```

This uses `qvm-run --pass-io` to pull each file from the AppVM into dom0's fish config directories.

### Manual

Copy the files directly into dom0:

```bash
cp completions/*.fish ~/.config/fish/completions/
cp functions/*.fish ~/.config/fish/functions/
```

Then reload:

```bash
exec fish
```

## Structure

```
completions/   # one .fish file per qvm-* command
functions/     # shared helper functions (VM lists, device IDs, etc.)
```

Helper functions (prefixed `__qvm_`) are used internally by the completions to dynamically fetch VM names, device IDs, pool names, etc. at completion time.

## Covered commands

`qubes-prefs`, `qvm-appmenus`, `qvm-backup`, `qvm-backup-restore`, `qvm-block`, `qvm-check`, `qvm-clone`, `qvm-console`, `qvm-console-dispvm`, `qvm-copy`, `qvm-copy-to-vm`, `qvm-create`, `qvm-device`, `qvm-features`, `qvm-firewall`, `qvm-get-image`, `qvm-get-tinted-image`, `qvm-kill`, `qvm-ls`, `qvm-move`, `qvm-move-to-vm`, `qvm-notes`, `qvm-pause`, `qvm-pci`, `qvm-pool`, `qvm-prefs`, `qvm-remove`, `qvm-run`, `qvm-service`, `qvm-shutdown`, `qvm-start`, `qvm-start-daemon`, `qvm-start-gui`, `qvm-sync-appmenus`, `qvm-sync-clock`, `qvm-tags`, `qvm-template`, `qvm-template-postprocess`, `qvm-unpause`, `qvm-usb`, `qvm-volume`, `qvm-xkill`

## License

MIT
