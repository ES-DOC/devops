#!/usr/bin/env bash

# ###############################################################
# UTILS: helper functions
# ###############################################################

# Wraps standard echo by adding application prefix.
function opal_log ()
{
    # Set timestamp.
    declare now=`date +%Y-%m-%dT%H:%M:%S:000000`

    # Support tabs.
    declare tabs=''

    # Emit opal log message.
    if [ "$1" ]; then
        if [ "$2" ]; then
            for ((i=0; i<$2; i++))
            do
                declare tabs+='\t'
            done
            echo $now" [INFO] [$$] OPAL :: "$tabs$1
        else
            echo $now" [INFO] [$$] OPAL :: "$1
        fi
    else
        echo $now" [INFO] [$$] OPAL :: "
    fi
}

# Wraps standard echo by adding application prefix.
function opal_log_error ()
{
    # Set timestamp.
    declare now=`date +%Y-%m-%dT%H:%M:%S:000000`

    # Support tabs.
    declare tabs=''

    # Emit opal error message.
    if [ "$1" ]; then
        if [ "$2" ]; then
            for ((i=0; i<$2; i++))
            do
                declare tabs+='\t'
            done
            echo $now" [ERROR] [$$] OPAL :: "$tabs$1
        else
            echo $now" [ERROR] [$$] OPAL :: "$1
        fi
    else
        echo $now" [ERROR] [$$] OPAL :: "
    fi
}

# Wraps pushd command to suppress stdout.
function pushd ()
{
    command pushd "$@" > /dev/null
}

# Wraps popd command to suppress stdout.
function popd ()
{
    command popd "$@" > /dev/null
}
