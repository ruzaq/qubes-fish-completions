complete -c qvm-features -f

# 1st positional arg: VM name
complete -c qvm-features -n 'test (__qvm_count_pos_args) -eq 0' -f -a '(__qvm_vms)' -d 'VM'

# 2nd positional arg: known feature names (non-exhaustive; many features are VM-specific)
set -l known_features \
    audio-model gui-trusted no-monitor-layout \
    supported-service.qubes-firewall supported-service.network-manager \
    supported-service.clocksync \
    video-model gui stubdom-qrexec-timeout

complete -c qvm-features -n 'test (__qvm_count_pos_args) -eq 1' -f -a "$known_features" -d 'Feature'

complete -c qvm-features -l unset   -d 'Unset feature (alias: --default)'
complete -c qvm-features -s D -l default -d 'Unset feature'
complete -c qvm-features -s h -l help    -d 'Show help'
