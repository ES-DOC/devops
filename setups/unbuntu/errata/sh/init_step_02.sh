# Main entry point.
main()
{
    installer_log "... initialising services"

    # Postgres
    apt install postgresql postgresql-contrib

    # Nginx
    apt install nginx
    ufw allow 'Nginx Full'
}

# Invoke entry point.
main
