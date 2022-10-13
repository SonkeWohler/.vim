cd ../config
configs=$(pwd)

sudo touch /bin/xswap.bash
echo '#!/bin/bash' | sudo tee /bin/xswap.bash
echo "xmodmap $configs/swap.xmodmap" | sudo tee -a /bin/xswap.bash
sudo chmod +x /bin/xswap.bash

sudo touch /bin/start_alacritty.bash
echo '#!/bin/bash' | sudo tee /bin/start_alacritty.bash
echo "alacritty --working-directory $configs/.. -e tmux"| sudo tee -a /bin/start_alacritty.bash
sudo chmod +x /bin/start_alacritty.bash
