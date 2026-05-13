function __qvm_pci_ids -d 'List available PCI BACKEND:DEVICE_ID pairs'
    qvm-device pci list 2>/dev/null | awk 'NR>1 {print $1}'
end
