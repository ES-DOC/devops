# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    # log "... step 5.1: creating DB objects"
	pushd /opt/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/step_05.py
	popd

    log "END step 5"
}

# Invoke entry point.
main
