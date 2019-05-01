#!/bin/sh
sed -i "s/#shared_preload_libraries.*$/shared_preload_libraries = 'plugin_debugger'/" \
    /var/lib/postgresql/data/pgdata/postgresql.conf