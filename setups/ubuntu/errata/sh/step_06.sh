# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 6:"

    if [[ ! -d /opt/devops/tmp ]]; then
        mkdir /opt/devops/tmp
    fi

    cat >> /opt/devops/tmp/creds.sql <<- EOM
ALTER USER esdoc PASSWORD '$ERRATA_DB_PWD';
EOM

    sudo -i -u postgres psql -d esdoc_errata -q -f /opt/devops/tmp/creds.sql

    # log "... step 6.1: creating DB objects"
	# pushd /opt/esdoc-errata-ws
	# pipenv run python $INSTALLER_HOME/sh/step_06.py
	# popd

    log "END step 6"
}

# Invoke entry point.
main
