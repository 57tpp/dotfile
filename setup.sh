#/bin/bash

find ~/dotfile -not \( -path '*/\.git/*' -o -name 'setup.sh' -o -name '.zshrc' -o -name 'README.md' \) | xargs -I {} ln -sf {} ~
