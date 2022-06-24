# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "... initialising stack"

    if [[ ! -d /opt/esdoc ]]; then
        mkdir /opt/esdoc
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-fe ]]; then
        git clone https://github.com/ES-DOC/esdoc-errata-fe.git /opt/esdoc/
    else
        pushd /opt/esdoc/esdoc-errata-fe
        git pull
        popd
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-ws ]]; then
        git clone https://github.com/ES-DOC/esdoc-errata-ws.git /opt/esdoc/
    else
        pushd /opt/esdoc/esdoc-errata-ws
        git pull
        popd
    fi
}

# Invoke entry point.
main
