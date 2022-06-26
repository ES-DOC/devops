```
# ---------------------------------------------------------------------------
# Step 01: Initialise system + services.
# ---------------------------------------------------------------------------

sudo -s
apt install git
git clone https://github.com/ES-DOC/devops.git /opt/devops
source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-01
exit

# ---------------------------------------------------------------------------
# Step 02: Initialise pyenv.
# ---------------------------------------------------------------------------

source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-02
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 03: Initialise python.
# ---------------------------------------------------------------------------

errata-installer-step-03

# ---------------------------------------------------------------------------
# Step 04: Initialise stack.
# ---------------------------------------------------------------------------

errata-installer-step-04
source ~/.bashrc

# ---------------------------------------------------------------------------
# Step 04: Initialise database.
# ---------------------------------------------------------------------------

errata-installer-step-05
source ~/.bashrc
```