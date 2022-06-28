# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_SHARED/sh/utils.sh

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
	for REPO in "${INSTALLER_REPOS[@]}"
	do
        if [[ ! -d /opt/$REPO ]]; then
            pushd /opt    
            git clone -q https://github.com/ES-DOC/$REPO.git
            popd
        else
            pushd /opt/$REPO
            git pull -q
            popd
        fi
	done
}

# Invoke entry point.
main
