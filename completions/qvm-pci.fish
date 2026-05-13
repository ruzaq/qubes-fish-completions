complete -c qvm-pci -f

complete -c qvm-pci -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a 'list\t"List PCI devices" attach\t"Attach device to VM" detach\t"Detach device from VM" assign\t"Assign device to VM" unassign\t"Remove device assignment" info\t"Show device info"'

complete -c qvm-pci \
    -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from attach detach at a d dt assign s unassign u' \
    -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-pci \
    -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from info i' \
    -f -a '(__qvm_pci_ids)' -d 'Backend:DeviceID'

complete -c qvm-pci \
    -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from attach at a assign s detach d dt unassign u' \
    -f -a '(__qvm_pci_ids)' -d 'Backend:DeviceID'

complete -c qvm-pci -n '__fish_seen_subcommand_from list ls l' -l assignments -d 'Show assignments'
complete -c qvm-pci -n '__fish_seen_subcommand_from list ls l' -l with-sbdf   -d 'Show SBDF address'
complete -c qvm-pci -n '__fish_seen_subcommand_from list ls l' -l all         -d 'Include all VMs'
complete -c qvm-pci -n '__fish_seen_subcommand_from list ls l' -l exclude -r  -d 'Exclude VM'

complete -c qvm-pci -n '__fish_seen_subcommand_from attach at a assign s' -l option -r -d 'Device option (key=value)'
complete -c qvm-pci -n '__fish_seen_subcommand_from attach at a assign s' -l ro        -d 'Read-only'
complete -c qvm-pci -n '__fish_seen_subcommand_from attach at a'          -l persistent -d 'Persist across reboots'
complete -c qvm-pci -n '__fish_seen_subcommand_from assign s'             -l ask      -d 'Ask before attaching'
complete -c qvm-pci -n '__fish_seen_subcommand_from assign s'             -l required -d 'Always attach'
complete -c qvm-pci -n '__fish_seen_subcommand_from assign s unassign u'  -l port     -d 'Match by port'
complete -c qvm-pci -n '__fish_seen_subcommand_from assign s unassign u'  -l device   -d 'Match by device identity'

complete -c qvm-pci -s v -l verbose -d 'Increase verbosity'
complete -c qvm-pci -s q -l quiet   -d 'Decrease verbosity'
complete -c qvm-pci -s h -l help    -d 'Show help'
