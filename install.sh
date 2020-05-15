sudo apt upgrade
sudo apt update
sudo apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
sudo apt install git curl zsh xclip
sudo apt install python3
zsh --version
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install fonts-firacode
sudo -v && curl -fsSL https://starship.rs/install.sh | sudo bash
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
pyenv install 3.8.1
pyenv global 3.8.1
cd ~
mkdir Code
cd Code
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
pip install --upgrade pip
pip install virtualenvwrapper
sudo mkdir virtualenvwrapper
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustc --version
ssh-keygen -t rsa -b 4096 -C "kydlawj@pm.me"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -o -sel clip < ~/.ssh/id_rsa.pub
code ~/.ssh/id_rsa.pub