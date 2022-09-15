#!/bin/bash
set -e

rm -f /carcierge/tmp/pids/server.pid

exec "$@"
