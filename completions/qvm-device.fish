complete -c qvm-device -f

# Global options
complete -c qvm-device -s v -l verbose           -d 'Increase verbosity'
complete -c qvm-device -s q -l quiet             -d 'Decrease verbosity'
complete -c qvm-device -s h -l help              -d 'Show help'
complete -c qvm-device -l version                -d 'Show version'
complete -c qvm-device -l list-device-classes    -d 'List available device classes'

# 1st positional arg: DEVICE_CLASS
complete -c qvm-device -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a 'block\t"Block devices" usb\t"USB devices" pci\t"PCI devices"'

# 2nd positional arg: SUBCOMMAND
complete -c qvm-device -n 'test (__qvm_count_pos_args) -eq 1' \
    -f -a 'list\t"List devices" attach\t"Attach device to VM" detach\t"Detach device from VM" assign\t"Assign device to VM" unassign\t"Remove device assignment" info\t"Show device info"'

# 3rd positional arg: VMNAME (attach / detach / assign / unassign)
complete -c qvm-device \
    -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from attach at a detach d dt assign s unassign u' \
    -f -a '(__qvm_vms)' -d 'VM'

# 3rd positional arg: BACKEND:DEVICE_ID (info)
complete -c qvm-device \
    -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from info i' \
    -f -a '(__qvm_device_ids)' -d 'Backend:DeviceID'

# 4th positional arg: BACKEND:DEVICE_ID (attach / assign)
complete -c qvm-device \
    -n 'test (__qvm_count_pos_args) -eq 3 && __fish_seen_subcommand_from attach at a assign s' \
    -f -a '(__qvm_device_ids)' -d 'Backend:DeviceID'

# 4th positional arg: optional BACKEND:DEVICE_ID (detach / unassign)
complete -c qvm-device \
    -n 'test (__qvm_count_pos_args) -eq 3 && __fish_seen_subcommand_from detach d dt unassign u' \
    -f -a '(__qvm_device_ids)' -d 'Backend:DeviceID'

# list subcommand options
complete -c qvm-device -n '__fish_seen_subcommand_from list ls l' \
    -l assignments  -d 'Show assigned devices'
complete -c qvm-device -n '__fish_seen_subcommand_from list ls l' \
    -l with-sbdf    -d 'Show SBDF address (PCI)'
complete -c qvm-device -n '__fish_seen_subcommand_from list ls l' \
    -l all          -d 'Include devices from all VMs'
complete -c qvm-device -n '__fish_seen_subcommand_from list ls l' \
    -l exclude -r   -d 'Exclude VM'

# attach / assign shared options
complete -c qvm-device -n '__fish_seen_subcommand_from attach at a assign s' \
    -l option -r    -d 'Device option (key=value)'
complete -c qvm-device -n '__fish_seen_subcommand_from attach at a assign s' \
    -l ro           -d 'Attach read-only'

# attach-only option
complete -c qvm-device -n '__fish_seen_subcommand_from attach at a' \
    -l persistent   -d 'Persist attachment across reboots'

# assign-only options
complete -c qvm-device -n '__fish_seen_subcommand_from assign s' \
    -l ask          -d 'Ask before attaching (mutually exclusive with --required)'
complete -c qvm-device -n '__fish_seen_subcommand_from assign s' \
    -l required     -d 'Always attach (mutually exclusive with --ask)'
complete -c qvm-device -n '__fish_seen_subcommand_from assign s unassign u' \
    -l port         -d 'Match by port (not device identity)'
complete -c qvm-device -n '__fish_seen_subcommand_from assign s unassign u' \
    -l device       -d 'Match by device identity'
