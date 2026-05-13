complete -c qvm-tags -f

# 1st positional arg: VM name
complete -c qvm-tags -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

# 2nd positional arg: subcommand
complete -c qvm-tags -n 'test (__qvm_count_pos_args) -eq 1' -f \
    -a 'add\t"Add a tag" del\t"Remove a tag" list\t"List tags"'

complete -c qvm-tags -s h -l help -d 'Show help'
