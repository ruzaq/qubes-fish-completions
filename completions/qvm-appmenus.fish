complete -c qvm-appmenus -f

complete -c qvm-appmenus -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-appmenus -l init            -d 'Create initial desktop entries'
complete -c qvm-appmenus -l update          -d 'Update desktop entries'
complete -c qvm-appmenus -l remove          -d 'Remove desktop entries'
complete -c qvm-appmenus -l get-available   -d 'List available applications in VM'
complete -c qvm-appmenus -l get-whitelist   -d 'List whitelisted applications'
complete -c qvm-appmenus -l set-whitelist -r -d 'Set whitelist from file'
complete -c qvm-appmenus -l source -r -f -a '(__qvm_vms)' -d 'Use this VM as app source'
complete -c qvm-appmenus -l force-rpc       -d 'Force RPC even for templates'
complete -c qvm-appmenus -s v -l verbose    -d 'Increase verbosity'
complete -c qvm-appmenus -s q -l quiet      -d 'Decrease verbosity'
complete -c qvm-appmenus -s h -l help       -d 'Show help'
