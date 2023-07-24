cd ../config
configs=$(pwd)

# map caps to control and control to escape
sudo touch /bin/xswap.bash
echo '#!/bin/bash' | sudo tee /bin/xswap.bash
echo "xmodmap $configs/swap.xmodmap" | sudo tee -a /bin/xswap.bash
sudo chmod +x /bin/xswap.bash

# convenient alacritty with tmux in the right location
sudo touch /bin/start_alacritty.bash
echo '#!/bin/bash' | sudo tee /bin/start_alacritty.bash
echo "alacritty --working-directory $configs/.. -e tmux"| sudo tee -a /bin/start_alacritty.bash
sudo chmod +x /bin/start_alacritty.bash

# default startup script
sudo touch /bin/sonke_system_startup.bash
echo '#!/bin/bash' | sudo tee /bin/sonke_system_startup.bash
echo '/bin/xswap.bash' | sudo tee -a /bin/sonke_system_startup.bash
echo '~/.tmux/plugins/tpm/bin/update_plugins all' | sudo tee -a /bin/sonke_system_startup.bash
sudo chmod +x /bin/sonke_system_startup.bash

# dictionary for nvim cmp
sudo mkdir --parents --verbose /usr/share/dicts
aspell -d en dump master | aspell -l en expand | sudo tee /usr/share/dicts/en.dict
