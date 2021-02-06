#
# NPM Setup
#

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

# Allow running local npm apps
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }
alias npm-exec='PATH=$(npm bin):$PATH'
