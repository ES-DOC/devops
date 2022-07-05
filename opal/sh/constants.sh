#!/usr/bin/env bash

# Array of managed archives.
declare -a OPAL_ARCHIVES=(
	'esdoc-archive'
	'pyessv-archive'
	'esdoc-cdf2cim-archive'
)

# Array of managed libraries.
declare -a OPAL_LIBS=(
    'esdoc-api'
    'esdoc-cdf2cim-ws'
    'esdoc-errata-ws'
	'pyessv-docs'
	'pyessv-ws'
    'esdoc-technical'
    'esdoc-web-compare'
    'esdoc-web-explorer'
    'esdoc-web-search'
    'esdoc-web-view'
    'esdoc-web-view-specialization'
    'esdoc-errata-fe'
	'esdoc-py-client'
    'esdoc-web-static'
)

# Array of managed URL rewriters.
declare -a OPAL_REWRITERS=(
	'further-info'
	'documentation'
	'specializations'
)

# Python versions.
declare -r OPAL_PYTHON_2=2.7.18
declare -r OPAL_PYTHON_3=3.9.0
