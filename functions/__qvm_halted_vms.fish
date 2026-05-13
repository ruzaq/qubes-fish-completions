function __qvm_halted_vms -d 'List halted (stopped) QubesOS VMs'
    qvm-ls 2>/dev/null | awk 'NR>1 && $2=="Halted" {print $1}'
end
