# Main entry point.
main()
{
    installer_log "... initialising stack"
    
    mkdir /opt/esdoc
    git clone https://github.com/ES-DOC/esdoc-errata-fe.git /opt/esdoc
    git clone https://github.com/ES-DOC/esdoc-errata-ws.git /opt/esdoc
}

# Invoke entry point.
main
