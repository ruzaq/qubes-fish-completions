complete -c qvm-pause -f

complete -c qvm-pause -f -a '(__qvm_running_vms)' -d 'Running VM'

complete -c qvm-pause -s h -l help -d 'Show help'
