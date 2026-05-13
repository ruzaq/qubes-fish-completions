function __qvm_device_ids -d 'List BACKEND:DEVICE_ID for the device class on the current cmdline'
    set -l tokens (commandline -opc)
    # tokens[1]=qvm-device, tokens[2]=DEVICE_CLASS
    set -l cls $tokens[2]
    if test -n "$cls"
        qvm-device $cls list 2>/dev/null | awk 'NR>1 {print $1}'
    end
end
