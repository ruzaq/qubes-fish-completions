complete -c qvm-template-postprocess -f

complete -c qvm-template-postprocess -n 'test (__qvm_count_pos_args) -eq 0' \
    -f -a 'post-install\t"Run after template install" pre-remove\t"Run before template removal"'

complete -c qvm-template-postprocess -n 'test (__qvm_count_pos_args) -eq 1' \
    -f -a '(__qvm_installed_templates)' -d 'Template'
