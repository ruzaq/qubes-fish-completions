function __qvm_vms -d 'List all QubesOS VMs'
    qvm-ls --raw-list 2>/dev/null
end
