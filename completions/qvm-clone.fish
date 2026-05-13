complete -c qvm-clone -f

# 1st positional arg: source VM; 2nd: new name (free text)
complete -c qvm-clone -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'Source VM'

complete -c qvm-clone -s t -l template -r -f -a '(__qvm_vms)' -d 'Override template'
complete -c qvm-clone -s n -l netvm    -r -f -a '(__qvm_vms)' -d 'Override netvm'
complete -c qvm-clone -s l -l label    -r -f -a 'red orange yellow green gray blue purple black' -d 'Override label'
complete -c qvm-clone -s P -l pool     -r -d 'Storage pool'
complete -c qvm-clone -s h -l help     -d 'Show help'
