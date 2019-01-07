#!/bin/bash
set -e

# Generate config
confd -onetime -sync-only

# Start haproxy in the background
haproxy -f /usr/local/etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -D

exec "$@"
