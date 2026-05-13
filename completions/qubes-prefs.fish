complete -c qubes-prefs -f

set -l global_props \
    check_updates_vm clockvm default_dispvm default_fw_netvm \
    default_kernel default_netvm default_pool \
    default_pool_kernel default_pool_private default_pool_root \
    default_pool_volatile default_template default_user \
    management_dispvm stats_interval updatevm

# 1st positional arg: property name
complete -c qubes-prefs -n 'test (__qvm_count_pos_args) -eq 0' -f -a "$global_props"

# 2nd positional arg: VM-valued properties
complete -c qubes-prefs -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from check_updates_vm clockvm default_dispvm default_fw_netvm default_netvm default_template management_dispvm updatevm' \
    -f -a '(__qvm_vms)' -d 'VM'

complete -c qubes-prefs -s D -l default -d 'Reset property to default'
complete -c qubes-prefs -s h -l help    -d 'Show help'
