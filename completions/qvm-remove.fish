complete -c qvm-remove -f

complete -c qvm-remove -f -a '(__qvm_halted_vms)' -d 'Halted VM'

complete -c qvm-remove -s f -l force   -d 'Force removal even if not cleanly stopped'
complete -c qvm-remove -l just-db      -d 'Remove from DB only, leave storage intact'
complete -c qvm-remove -s h -l help    -d 'Show help'
