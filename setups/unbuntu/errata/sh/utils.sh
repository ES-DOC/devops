#!/usr/bin/env bash

# ###############################################################
# UTILS: helper functions
# ###############################################################

# Wraps standard echo by adding application prefix.
function installer_log ()
{
    # Set timestamp.
    declare now=`date +%Y-%m-%dT%H:%M:%S:000000`

    # Support tabs.
    declare tabs=''

    # Emit log message.
    if [ "$1" ]; then
        if [ "$2" ]; then
            for ((i=0; i<$2; i++))
            do
                declare tabs+='\t'
            done
            echo $now" [INFO] [$$] ERRATA :: "$tabs$1
        else
            echo $now" [INFO] [$$] ERRATA :: "$1
        fi
    else
        echo $now" [INFO] [$$] ERRATA :: "
    fi
}

# Wraps standard echo by adding application prefix.
function installer_log_error ()
{
    # Set timestamp.
    declare now=`date +%Y-%m-%dT%H:%M:%S:000000`

    # Support tabs.
    declare tabs=''

    # Emit installer error message.
    if [ "$1" ]; then
        if [ "$2" ]; then
            for ((i=0; i<$2; i++))
            do
                declare tabs+='\t'
            done
            echo $now" [ERROR] [$$] ERRATA :: "$tabs$1
        else
            echo $now" [ERROR] [$$] ERRATA :: "$1
        fi
    else
        echo $now" [ERROR] [$$] ERRATA :: "
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
