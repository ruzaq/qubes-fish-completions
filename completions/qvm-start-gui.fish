# qvm-start-gui is a command link to qvm-start-daemon
complete -c qvm-start-gui -f

complete -c qvm-start-gui -f -a '(__qvm_running_vms)' -d 'Running VM'

complete -c qvm-start-gui -l all              -d 'Start for all running VMs'
complete -c qvm-start-gui -l watch            -d 'Keep watching for newly started VMs'
complete -c qvm-start-gui -l force-stubdomain -d 'Force stub domain'
complete -c qvm-start-gui -s v -l verbose     -d 'Increase verbosity'
complete -c qvm-start-gui -s q -l quiet       -d 'Decrease verbosity'
complete -c qvm-start-gui -s h -l help        -d 'Show help'
