#!/bin/bash
git clone https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
python_version="$(python3 -V | cut -d ' ' -f 2)"
pyenv install "$python_version"
pyenv global "$python_version"
git clone https://github.com/pyenv/pyenv-virtualenv.git "$(pyenv root)"/plugins/pyenv-virtualenv
pip install --upgrade pip
pip3 install wheel pwntools neovim keystone-engine ropper jedi rope flake8 autopep8 yapf black
# needs to be run twice or else it doesn't install due to a possible error in keystone-engine
pip3 install wheel pwntools neovim keystone-engine ropper jedi rope flake8 autopep8 yapf black
