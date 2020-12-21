#######################################
# Initialises system.
# Globals:
#   HOME - current user's home directory.
#######################################
function main () {
    rm -rf $HOME/tmp/*
    cp $OPAL_HOME/backups/* $HOME/tmp
    pushd $HOME/tmp
    gzip -d ./*.sql.gz
    popd
}

# Invoke entry point.
main