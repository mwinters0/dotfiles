sshfs "$@" \
  -o sshfs_sync,sync_readdir,transform_symlinks,dcache_timeout=30,direct_io,reconnect

