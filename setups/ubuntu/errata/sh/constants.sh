#!/usr/bin/env bash

# Array of managed libraries.
declare -a INSTALLER_LIBS=(
    'esdoc-errata-fe'
    'esdoc-errata-ws'
)

# Python versions.
declare INSTALLER_PYTHON_2=2.7.18
declare INSTALLER_PYTHON_3=3.9.0
