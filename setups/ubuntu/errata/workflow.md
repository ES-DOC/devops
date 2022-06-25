```
# ---------------------------------------------------------------------------
# Step 00: Setup installer.
# ---------------------------------------------------------------------------

sudo -s
apt install git
git clone https://github.com/ES-DOC/devops.git /opt/devops
exit

# ---------------------------------------------------------------------------
# Step 01: Setup system.
# ---------------------------------------------------------------------------

sudo -s
source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-01
exit

# ---------------------------------------------------------------------------
# Step 02: Setup python.
# ---------------------------------------------------------------------------

sudo -s
source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-02
exit

# ---------------------------------------------------------------------------
# Step 03: Setup stack.
# ---------------------------------------------------------------------------

sudo -s
source /opt/devops/setups/ubuntu/errata/activate
errata-installer-step-03
exit
```