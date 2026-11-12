function __qvm_pref_values -a prop current -d 'Possible values of a property'
    switch $prop
        case netvm default_netvm default_dispvm management_dispvm audiovm guivm \
            default_audiovm default_guivm default_fw_netvm updatevm clockvm
            __qvm_vms
        case template default_template
            __qvm_templates
        case label
            printf '%s\n' red orange yellow green gray blue purple black
        case virt_mode
            printf '%s\n' pvh hvm pv
        case kernel default_kernel
            path basename /var/lib/qubes/vm-kernels/*
        case 'default_pool*'
            __qvm_pools
        case '*'
            if contains -- "$current" True False
                printf '%s\n' True False
            end
    end
end
