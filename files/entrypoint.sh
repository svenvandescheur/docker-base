#!/bin/bash

# Docker entrypoint script
# Executes original command

# Summary:
# --------
# * Set up script
# * Start services
# * Execute command

# Set up script
set -e
set -o pipefail


# Start services
service rsyslog start
service cron start
service postfix start


# Execute command
exec "$@"