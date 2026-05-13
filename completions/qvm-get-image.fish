complete -c qvm-get-image -f

complete -c qvm-get-image -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-get-image -s h -l help -d 'Show help'
