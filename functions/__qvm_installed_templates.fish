function __qvm_installed_templates -d 'List installed QubesOS templates'
    qvm-ls 2>/dev/null | awk 'NR>1 && $3=="TemplateVM" {print $1}'
end
