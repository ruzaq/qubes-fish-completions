complete -c qvm-service -f

# 1st positional arg: VM name
complete -c qvm-service -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

# 2nd positional arg: subcommand
complete -c qvm-service -n 'test (__qvm_count_pos_args) -eq 1' -f \
    -a 'enable\t"Enable service" disable\t"Disable service" default\t"Reset to default" list\t"List services"'

# 3rd positional arg: service name (when enabling/disabling)
set -l common_services \
    qubes-firewall network-manager clocksync meminfo-writer \
    cups cups-browsed crond sshd

complete -c qvm-service -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from enable disable default' \
    -f -a "$common_services" -d 'Service'

complete -c qvm-service -s h -l help -d 'Show help'
