# Main entry point.
main()
{
    log "BEGIN step 7:"

    cdf2cim-ws-daemon
    documentation-ws-daemon
    errata-ws-daemon
    pyessv-ws-daemon

    log "END step 7"
}

# Invoke entry point.
main
