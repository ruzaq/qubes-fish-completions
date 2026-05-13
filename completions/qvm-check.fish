complete -c qvm-check -f

complete -c qvm-check -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-check -l running    -d 'Check if VM is running (exit 0 if yes)'
complete -c qvm-check -l paused     -d 'Check if VM is paused'
complete -c qvm-check -l template   -d 'Check if VM is a template'
complete -c qvm-check -l networked  -d 'Check if VM has network access'
complete -c qvm-check -s h -l help  -d 'Show help'
