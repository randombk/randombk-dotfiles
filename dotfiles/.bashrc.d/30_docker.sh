#
# Docker Setup
#

# Default to the user-specific docker socket when we're not running as root
if [ "$(id -u)" -ne 0 ]; then
    export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
fi

