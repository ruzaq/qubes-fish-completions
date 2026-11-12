function __qvm_vm_prefs -a vm -d 'Properties of a qube, current value as description'
    # qvm-prefs prints: name  D|-  value
    qvm-prefs $vm 2>/dev/null | string replace -r '^(\S+)\s+[-D](?:\s+|$)' '$1\t'
end
