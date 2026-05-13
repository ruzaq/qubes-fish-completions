complete -c qvm-kill -f

complete -c qvm-kill -f -a '(__qvm_running_vms)' -d 'Running VM'

complete -c qvm-kill -l all    -d 'Kill all running VMs'
complete -c qvm-kill -s h -l help -d 'Show help'
