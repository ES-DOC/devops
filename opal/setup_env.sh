mkdir $HOME/.esdoc
cp $HERE/template_env.txt $HOME/.esdoc/env.sh

cat >> $HOME/.bashrc <<- EOM

# ----------------------------------------------------------------------
# ES-DOC - ENV
# ----------------------------------------------------------------------

# Activate nctl shell.
source $HOME/.esdoc/env.sh

EOM
