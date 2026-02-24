cd ../config
configs=$(pwd)

# dictionary for nvim cmp
# used in neovim/lua/lsp_setup.lua
sudo mkdir --parents --verbose /usr/share/dicts
aspell -d en dump master | aspell -l en expand | sudo tee /usr/share/dicts/en.dict
