function __qvm_templates -d 'Template qubes'
    qvm-ls --class TemplateVM --raw-list 2>/dev/null
end
