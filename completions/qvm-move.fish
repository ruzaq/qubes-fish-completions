# qvm-move opens a GUI for destination selection; only file args are relevant
complete -c qvm-move -l without-progress   -d "Don't show progress indicator"
complete -c qvm-move -l with-progress      -d 'Show progress indicator (default)'
complete -c qvm-move -l ignore-symlinks    -d 'Skip symbolic links'
complete -c qvm-move -l no-ignore-symlinks -d 'Follow symbolic links (default)'
complete -c qvm-move -s h -l help          -d 'Show help'
