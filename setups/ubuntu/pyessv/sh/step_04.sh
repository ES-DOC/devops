# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_GLOBAL/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising repos"
    _init_repos

    log "END step 4"
}

# Initialises source code repos.
function _init_repos() {
    if [[ ! -d /opt/pyessv-archive ]]; then
        pushd /opt    
        git clone -q https://github.com/ES-DOC/pyessv-archive.git
        popd
    else
        pushd /opt/pyessv-archive
        git pull -q
        popd
    fi

    if [[ ! -d /opt/pyessv-ws ]]; then
        pushd /opt    
        git clone -q https://github.com/ES-DOC/pyessv-ws.git
        popd
    else
        pushd /opt/pyessv-ws
        git pull -q
        popd
    fi
}

# Invoke entry point.
main
