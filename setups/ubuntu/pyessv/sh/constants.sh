#!/usr/bin/env bash

# Imports.
source $INSTALLER_GLOBAL/sh/constants.sh

# Array of managed libraries.
declare -a INSTALLER_LIBS=(
    'pyessv'
    'pyessv-archive'
    'pyessv-js'
    'pyessv-writers'
    'pyessv-ws'
)
