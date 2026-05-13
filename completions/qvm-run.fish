complete -c qvm-run -f

# First positional arg: VM name; after that fish can complete the command normally
complete -c qvm-run -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

complete -c qvm-run -s a -l auto-start    -d 'Auto-start VM if not running'
complete -c qvm-run -s u -l user -r       -d 'Run as this user'
complete -c qvm-run -l no-gui             -d "Don't start GUI daemon"
complete -c qvm-run -l gui                -d 'Start GUI daemon (default)'
complete -c qvm-run -l pass-io            -d 'Pass stdin/stdout/stderr to VM'
complete -c qvm-run -l localcmd -r        -d 'Connect VM stdio to local command'
complete -c qvm-run -l dispvm             -d 'Run in a disposable VM'
complete -c qvm-run -l service            -d 'Run as qrexec service call'
complete -c qvm-run -s e -l exec          -d 'Execute via exec() in VM'
complete -c qvm-run -s p                  -d "Keep VM running after command exits"
complete -c qvm-run -l filter-escape-chars   -d 'Filter terminal escape chars (default)'
complete -c qvm-run -l no-filter-escape-chars -d "Don't filter terminal escape chars"
complete -c qvm-run -l color-output -r    -d 'ANSI color code for stdout'
complete -c qvm-run -l color-stderr -r    -d 'ANSI color code for stderr'
complete -c qvm-run -s q -l quiet         -d 'Suppress output'
complete -c qvm-run -s h -l help          -d 'Show help'
