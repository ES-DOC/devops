#!/bin/bash

# Import utils.
source $ESDOC_ARCHIVE_HOME/sh/utils.sh

# Main entry point.
main()
{
	log "compression: begins ..."

	pushd $OPAL_HOME/backups
	tar -czvf db-documentation.sql.gz db-documentation.sql
	tar -czvf db-errata.sql.gz db-errata.sql
	popd -1

	log "compression: complete"
}

# Invoke entry point.
main
