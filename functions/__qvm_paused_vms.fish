function __qvm_paused_vms -d 'List paused QubesOS VMs'
    qvm-ls 2>/dev/null | awk 'NR>1 && $2=="Paused" {print $1}'
end
