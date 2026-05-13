complete -c qvm-sync-appmenus -f

complete -c qvm-sync-appmenus -f -a '(__qvm_vms)' -d 'TemplateVM or StandaloneVM'

complete -c qvm-sync-appmenus -l force-rpc    -d 'Force RPC even for templates'
complete -c qvm-sync-appmenus -s v -l verbose -d 'Increase verbosity'
complete -c qvm-sync-appmenus -s q -l quiet   -d 'Decrease verbosity'
complete -c qvm-sync-appmenus -s h -l help    -d 'Show help'
