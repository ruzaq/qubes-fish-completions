complete -c qvm-notes -f

complete -c qvm-notes -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-notes -s h -l help -d 'Show help'
