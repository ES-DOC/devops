```
# ---------------------------------------------------------------------------
# Step 00: Prelude.
# ---------------------------------------------------------------------------

# This assumes a fresh debian 11+ install.
sudo -s

# Install git.
apt install git

# Initialise install directory.
if [[ ! -d /opt/esdoc ]]; then
    mkdir /opt/esdoc
    chmod 777 /opt/esdoc
fi

# Clone installer.
git clone https://github.com/ES-DOC/devops.git /opt/esdoc/devops

# Create installer tmp folder.
mkdir /opt/esdoc/devops/tmp

# Activate installer.
source /opt/esdoc/devops/installers/debian/activate

# ---------------------------------------------------------------------------
# Step 01: Initialise operating system.
# ---------------------------------------------------------------------------

esdoc-installer-step-01
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 02: Initialise pyenv.
# ---------------------------------------------------------------------------

esdoc-installer-step-02
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 03: Initialise python.
# ---------------------------------------------------------------------------

esdoc-installer-step-03
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 04: Initialise stack.
# ---------------------------------------------------------------------------

esdoc-installer-step-04
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 05: Initialise virtual environment.
# ---------------------------------------------------------------------------

esdoc-installer-step-05
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 06: Initialise database.
# ---------------------------------------------------------------------------

esdoc-installer-step-06
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 07: Run web-service daemons.
# ---------------------------------------------------------------------------

esdoc-installer-step-07
source ~/.bashrc

```