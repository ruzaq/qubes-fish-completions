function __qvm_running_vms -d 'List running QubesOS VMs'
    qvm-ls 2>/dev/null | awk 'NR>1 && $2=="Running" {print $1}'
end
