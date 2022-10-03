# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_SHARED/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising repos"
	for REPO in "${INSTALLER_REPOS[@]}"
	do
        init_stack_repo $REPO
	done

    log "END step 4"
}

# Invoke entry point.
main
