#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# fix
cd ~/.gem/ruby/gems/sassc-2.2.1/lib/sassc/ && ln -s ../../ext/libsass.so .

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
