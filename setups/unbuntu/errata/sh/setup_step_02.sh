function _step_01() {
    # Update OS.
	apt -qq -y update
	apt -qq -y upgrade

    # Install tools.
    apt -qq -y install git gh
    apt -qq -y install python3-pip
}

function _step_02() {
    # Source code.
    mkdir /opt/esdoc && cd /opt/esdoc
    gh repo clone ES-DOC/esdoc-errata-ws
    gh repo clone ES-DOC/esdoc-errata-fe

    # Python environments.
    pip3 install pipenv
}

# Main entry point.
main()
{
	_step_01
    _step_02
}

# Invoke entry point.
main
