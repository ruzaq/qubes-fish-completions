function __qvm_pci_ids -d 'Available pci devices, description included'
    qvm-device pci list 2>/dev/null | string match -rv '^BACKEND' | string replace -r '^(\S+)\s+' '$1\t'
end
