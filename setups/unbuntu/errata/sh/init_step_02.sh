# Main entry point.
main()
{
    # Postgres
    apt install -qq postgresql postgresql-contrib

    # Nginx
    apt install -qq nginx
    ufw allow 'Nginx Full'
}

# Invoke entry point.
main
