complete -c qvm-shutdown -f

complete -c qvm-shutdown -f -a '(__qvm_running_vms)' -d 'Running VM'

complete -c qvm-shutdown -l all                   -d 'Shutdown all running VMs'
complete -c qvm-shutdown -l wait                  -d 'Wait until VM is fully halted'
complete -c qvm-shutdown -l timeout -r            -d 'Timeout in seconds (default 60)'
complete -c qvm-shutdown -l force                 -d 'Force shutdown (like kill)'
complete -c qvm-shutdown -s q -l quiet            -d 'Suppress output'
complete -c qvm-shutdown -s h -l help             -d 'Show help'
