function __qvm_usb_ids -d 'List available USB BACKEND:DEVICE_ID pairs'
    qvm-device usb list 2>/dev/null | awk 'NR>1 {print $1}'
end
