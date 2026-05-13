complete -c qvm-get-tinted-image -f

complete -c qvm-get-tinted-image -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-get-tinted-image -n 'test (__qvm_count_pos_args) -eq 1' \
    -f -a 'red orange yellow green gray blue purple black' -d 'Tint color'

complete -c qvm-get-tinted-image -s h -l help -d 'Show help'
