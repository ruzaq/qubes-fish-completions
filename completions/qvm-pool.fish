complete -c qvm-pool -f

complete -c qvm-pool -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a 'list\t"List storage pools" info\t"Show pool details" add\t"Add a new pool" remove\t"Remove a pool" set\t"Set pool options"'

# info / remove / set: pool name
complete -c qvm-pool \
    -n 'test (__qvm_count_pos_args) -eq 1 && __fish_seen_subcommand_from info remove set' \
    -f -a '(__qvm_pools)' -d 'Pool'

# add: pool name (free text), then driver
complete -c qvm-pool \
    -n 'test (__qvm_count_pos_args) -eq 2 && __fish_seen_subcommand_from add' \
    -f -a 'file\t"File-based pool" file-reflink\t"File pool with reflinks" lvm_thin\t"LVM thin pool"' -d 'Driver'

complete -c qvm-pool -s v -l verbose -d 'Increase verbosity'
complete -c qvm-pool -s q -l quiet   -d 'Decrease verbosity'
complete -c qvm-pool -s h -l help    -d 'Show help'
