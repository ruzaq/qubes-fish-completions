complete -c qvm-firewall -f

# 1st positional arg: VM name
complete -c qvm-firewall -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

# 2nd positional arg: subcommand
complete -c qvm-firewall -n 'test (__qvm_count_pos_args) -eq 1' -f \
    -a 'list\t"List firewall rules" add\t"Add a rule" del\t"Delete a rule" reset\t"Reset to default (allow all)"'

# del: rule number
complete -c qvm-firewall -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from del' \
    -f -d 'Rule number'

# add: rule fields (positional key=value pairs)
complete -c qvm-firewall -n '__fish_seen_subcommand_from add' \
    -f -a 'action=accept\t"Accept traffic" action=drop\t"Drop traffic"'
complete -c qvm-firewall -n '__fish_seen_subcommand_from add' \
    -f -a 'proto=tcp proto=udp proto=icmp'
complete -c qvm-firewall -n '__fish_seen_subcommand_from add' \
    -f -a 'specialtarget=dns\t"DNS traffic"'

# list options
complete -c qvm-firewall -n '__fish_seen_subcommand_from list' -l raw -d 'Raw output'

# add options
complete -c qvm-firewall -n '__fish_seen_subcommand_from add' -l before -r -d 'Insert before rule number'

complete -c qvm-firewall -s v -l verbose -d 'Increase verbosity'
complete -c qvm-firewall -s q -l quiet   -d 'Decrease verbosity'
complete -c qvm-firewall -s h -l help    -d 'Show help'
