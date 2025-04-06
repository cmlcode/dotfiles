#
# ~/.profile
#

# Setup ssh agent for git
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
eval $(ssh-agent -s)
