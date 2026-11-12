function __qvm_vm_tags -a vm -d 'Tags of a qube'
    qvm-tags $vm list 2>/dev/null
end
