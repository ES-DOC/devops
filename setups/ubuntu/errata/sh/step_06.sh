# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    # log "... step 6.1: creating DB objects"
	pushd /opt/esdoc-errata-ws
	pipenv run python $INSTALLER_HOME/sh/step_05.py
	popd

    log "END step 6"
}

# Invoke entry point.
main
