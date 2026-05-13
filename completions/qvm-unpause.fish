complete -c qvm-unpause -f

complete -c qvm-unpause -f -a '(__qvm_paused_vms)' -d 'Paused VM'

complete -c qvm-unpause -s h -l help -d 'Show help'
