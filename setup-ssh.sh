# REFERENCE https://superuser.com/a/1808594


if grep -R "ker10epere" ~/.ssh/id_ed25519.pub
then
    echo '=>' SSH PUBLIC KEYS ALREADY EXISTING
else
    echo '=>' GENERATING SSH PUBLIC KEYS
    # INITIALIZE SSH
    # -f DONT PROMPT FOR MORE INFORMATION
    # -n DONT ADD PASSWORD
    ssh-keygen -t ed25519 -C "ker10epere@gmail.com" -f ~/.ssh/id_ed25519 -N ''
fi



# FOR TO START SSH AGENT AUTOMATICALLY
if grep -R "keychain" ~/.bashrc
then
    echo '=>' KEYCHAIN SSH AGENT ALREADY EXISTING IN '~/.bashrc'
else
    # INSTALL keychain FOR AUTOMATION OF SSH AGENT STARTUP ON LOGIN
    sudo apt install keychain -y
    echo '=>' PREPRENDING KEYCHAIN SSH AGENT IN '~/.bashrc'
    sed -i '1s/^/eval $(keychain --eval)\n/' ~/.bashrc
fi