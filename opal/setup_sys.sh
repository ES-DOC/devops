# System: set tmp directory.
cd $HOME
mkdir tmp
chmod a+x ./tmp
export TMPDIR=$HOME/tmp

# System: set pyenv.
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv update
pyenv install 3.9.0
pyenv install 2.7.18

pyenv global 3.9.0
pip install --upgrade pip
pip install --upgrade pipenv
pip install --upgrade supervisor
