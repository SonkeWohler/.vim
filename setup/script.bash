cd ../config
configs=$(pwd)

sudo touch /bin/xswap
echo '#!/bin/bash' | sudo tee /bin/xswap
echo "xmodmap $configs/swap.xmodmap" | sudo tee -a /bin/xswap
sudo chmod +x /bin/xswap

sudo touch /bin/start_alacritty.bash
echo '#!/bin/bash' | sudo tee /bin/start_alacritty.bash
echo "alacritty --working-directory $configs/.. -e tmux"| sudo tee -a /bin/start_alacritty.bash
sudo chmod +x /bin/start_alacritty.bash
