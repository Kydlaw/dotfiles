# Initialisation
sudo apt upgrade
sudo apt update
sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev git xclip
sudo apt install python3
# Zsh
sudo apt install zsh fonts-firacode
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo -v && curl -fsSL https://starship.rs/install.sh | sudo bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
# Pyenv part
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
exec "$SHELL"
pyenv install 3.8.3
pyenv global 3.8.3
# Pip part
cd ~
mkdir Code
cd Code
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
pip install --upgrade pip
# Virtualenvwrapper
pip install virtualenvwrapper
wget https://bitbucket.org/virtualenvwrapper/virtualenvwrapper/raw/f481be386e527c53bb2cc81ed965b66a93d4e792/virtualenvwrapper.sh
sudo mv virtualenvwrapper.sh /usr/local/bin/
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh
# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Interaction
source $HOME/.cargo/env
# GitHub keys
ssh-keygen -t rsa -b 4096 -C "kydlawj@pm.me"  # Interaction
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -o -sel clip < ~/.ssh/id_rsa.pub
code ~/.ssh/id_rsa.pub

