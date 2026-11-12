function __qvm_usb_ids -d 'Available usb devices, description included'
    qvm-device usb list 2>/dev/null | string match -rv '^BACKEND' | string replace -r '^(\S+)\s+' '$1\t'
end
