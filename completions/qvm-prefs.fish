complete -c qvm-prefs -f

set -l qvm_prefs_props \
    autostart debug default_dispvm default_user \
    include_in_backups internal ip ip6 \
    kernel kernelopts label mac maxmem memory name \
    netvm provides_network qrexec_timeout shutdown_timeout \
    template template_for_dispvms uuid vcpus virt_mode \
    visible_gateway visible_ip visible_netmask

# 1st positional arg: VM name
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

# 2nd positional arg: property name
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 1' -f -a "$qvm_prefs_props"

# 3rd positional arg for label: color values
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from label' \
    -f -a 'red orange yellow green gray blue purple black' -d 'Label color'

# 3rd positional arg for virt_mode
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from virt_mode' \
    -f -a 'pvh hvm pv' -d 'Virtualization mode'

# 3rd positional arg for netvm / default_dispvm / template
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from netvm default_dispvm template' \
    -f -a '(__qvm_vms)' -d 'VM'

# 3rd positional arg for boolean props
complete -c qvm-prefs -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from autostart debug include_in_backups internal provides_network template_for_dispvms' \
    -f -a 'True False' -d 'Boolean'

complete -c qvm-prefs -s D -l default -d 'Reset property to default value'
complete -c qvm-prefs -s h -l help    -d 'Show help'
