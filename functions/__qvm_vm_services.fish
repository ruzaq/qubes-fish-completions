function __qvm_vm_services -a vm -d 'Services set on a qube, state as description'
    qvm-service $vm 2>/dev/null | string replace -r '^(\S+)\s+' '$1\t'
end
