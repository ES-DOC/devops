```
# ---------------------------------------------------------------------------
# Step 00: Initialises installer.
# ---------------------------------------------------------------------------

sudo -s
apt install git
exit
chmod 777 /opt
git clone https://github.com/ES-DOC/devops.git /opt/devops
exit

# ---------------------------------------------------------------------------
# Step 01: Initialises system + services.
# ---------------------------------------------------------------------------

sudo -s
source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-01
exit

# ---------------------------------------------------------------------------
# Step 02: Initialises pyenv.
# ---------------------------------------------------------------------------

source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-02
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 03: Initialises python.
# ---------------------------------------------------------------------------

errata-installer-step-03

# ---------------------------------------------------------------------------
# Step 04: Initialises stack.
# ---------------------------------------------------------------------------

errata-installer-step-04
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 04: Initialises database.
# ---------------------------------------------------------------------------

errata-installer-step-05
source ~/.bashrc
```