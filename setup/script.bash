cd ../config
configs=$(pwd)

sudo touch /bin/xswap
echo '#!/bin/bash' | sudo tee /bin/xswap
echo "xmodmap $configs/swap.xmodmap" | sudo tee -a /bin/xswap
sudo chmod +x /bin/xswap

sudo touch /bin/start_alacritty
echo '#!/bin/bash' | sudo tee /bin/start_alacritty
echo "alacritty --working-directory $configs/.. -e tmux"| sudo tee -a /bin/start_alacritty
sudo chmod +x /bin/start_alacritty
