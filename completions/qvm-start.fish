complete -c qvm-start -f

# VM names (prefer halted, but also show running for --skip-if-running use case)
complete -c qvm-start -f -a '(__qvm_halted_vms)' -d 'Halted VM'

complete -c qvm-start -l skip-if-running -d "Don't fail if VM is already running"
complete -c qvm-start -l no-guid        -d "Don't start GUI daemon"
complete -c qvm-start -s q -l quiet     -d 'Suppress output'
complete -c qvm-start -s h -l help      -d 'Show help'
