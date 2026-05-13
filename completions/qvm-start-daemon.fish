complete -c qvm-start-daemon -f

complete -c qvm-start-daemon -f -a '(__qvm_running_vms)' -d 'Running VM'

complete -c qvm-start-daemon -l all              -d 'Start for all running VMs'
complete -c qvm-start-daemon -l watch            -d 'Keep watching for newly started VMs'
complete -c qvm-start-daemon -l force-stubdomain -d 'Force stub domain'
complete -c qvm-start-daemon -s v -l verbose     -d 'Increase verbosity'
complete -c qvm-start-daemon -s q -l quiet       -d 'Decrease verbosity'
complete -c qvm-start-daemon -s h -l help        -d 'Show help'
