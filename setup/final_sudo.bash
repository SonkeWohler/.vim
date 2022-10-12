
# this is a WIP for adjusting my keyboard layout
echo "#!/usr/bin/bash" >> /usr/bin/xswap
echo "# activating my xmodmap modifications" >> /usr/bin/xswap
echo "xmodmap /home/sonke/.config/swap.xmodmap" >> /usr/bin/xswap
chmod +x /usr/bin/xswap

