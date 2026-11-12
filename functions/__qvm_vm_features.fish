function __qvm_vm_features -a vm -d 'Features set on a qube, value as description'
    qvm-features $vm 2>/dev/null | string replace -r '^(\S+)\s+' '$1\t'
end
