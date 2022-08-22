Because I never really use GitHub issues for personal projects (which take place
almost entirely in the terminal, that's probably why), I'll see if this list is
better.  Judging by the state of the last TODO.md file I guess it won't be
better, but this will at least annoy me whenever I am editing neovim.  The other
file isn't so annoying.

* experiment with [autotag](https://github.com/windwp/nvim-ts-autotag) and see
  if I need to make any additional configurations
* replace lsp-install with mason see
  [here](https://github.com/williamboman/nvim-lsp-installer/discussions/876).
* check for lsp config to see if you can add pythonpath variables, start
  [here](https://github.com/neovim/nvim-lspconfig)
* checkout [lsp-saga](https://github.com/glepnir/lspsaga.nvim) and how hard it
  would be to install
    - I guess also compare this to trouble.nvim
* consider replacing sandwich with
  [surround](https://github.com/glepnir/lspsaga.nvim).
* look at neovim 0.8, apparently for October or so
* check out [trevJ](https://github.com/AckslD/nvim-trevJ.lua), but not to
  replace `<M-J>` for me, more like for `==`.
* consider whether [toggleterm](https://github.com/AckslD/nvim-trevJ.lua) could
  be useful at all.
* [lualine](https://github.com/nvim-lualine/lualine.nvim) has a global mode.
  what the hell is that?
* keep an eye out for debugger adapter protocol (DAP)
* one day, consider switching out fzf for
  [telescope](https://github.com/nvim-telescope/telescope.nvim)
  - make sure all mappings are in place, other than that it shouldn't actually
    require any changes.

Other than Neovim:
* [lazygit](https://github.com/jesseduffield/lazygit).  At least recommend to
  the guys on the team.
* check out [Helix](https://github.com/helix-editor/helix) and see if I can play
  with it without disrupting my workflow.
  
# work stuff:

## from connectors:
```
git remote set-url origin git@github.com:knosc/app-connectors.git
git checkout development && git pull
cd sheets-connector/ && git remote set-url origin git@github.com:knosc/app-sheets-connector.git ; cd ..
cd sharepoint-connector/ && git remote set-url origin git@github.com:knosc/app-sharepoint-connector.git ; cd ..
cd sftp-connector/ && git remote set-url origin git@github.com:knosc/app-sftp-connector.git ; cd ..
cd sftp-asn-connector/ && git remote set-url origin git@github.com:knosc/app-sftp-asn-connector.git ; cd ..
cd decmanager-connector/ && git remote set-url origin git@github.com:knosc/app-decmanager-connector.git ; cd ..
git submodule foreach 'git checkout development && git pull'
```

## from wms
```
git remote set-url origin git@github.com:knosc/app.git
git checkout development && git pull
cd common/ && git remote set-url origin git@github.com:knosc/app-common.git ; cd ..
cd inventory-planning/ && git remote set-url origin git@github.com:knosc/app-inventory-planning.git ; cd ..
cd nginx/ && git remote set-url origin git@github.com:knosc/app-nginx.git ; cd ..
cd postgres/ && git remote set-url origin git@github.com:knosc/app-postgres.git ; cd ..
cd redis/ && git remote set-url origin git@github.com:knosc/app-redis.git ; cd ..
cd rest-api/ && git remote set-url origin git@github.com:knosc/app-rest-api.git ; cd ..
cd tests/ && git remote set-url origin git@github.com:knosc/app-tests.git ; cd ..
cd ui/ && git remote set-url origin git@github.com:knosc/app-ui.git ; cd ..
cd upload-data/ && git remote set-url origin git@github.com:knosc/app-upload-data.git ; cd ..
cd web-sockets/ && git remote set-url origin git@github.com:knosc/app-web-sockets.git ; cd ..
git submodule foreach 'git checkout development && git pull'
```

## from platform
```
git remote set-url origin git@github.com:knosc/platform.git
git checkout development && git pull
cd admin-web-sockets/ && git remote set-url origin git@github.com:knosc/app-web-sockets.git ; cd ..
cd admin-nginx/ && git remote set-url origin git@github.com:knosc/platform-admin-nginx.git ; cd ..
cd admin-ui/ && git remote set-url origin git@github.com:knosc/platform-admin-ui.git ; cd ..
cd cli/ && git remote set-url origin git@github.com:knosc/platform-cli.git ; cd ..
cd docs/ && git remote set-url origin git@github.com:knosc/platform-docs.git ; cd ..
cd issue-tracker/ && git remote set-url origin git@github.com:knosc/platform-issue-tracker.git ; cd ..
cd kubernetes/ && git remote set-url origin git@github.com:knosc/platform-kubernetes.git ; cd ..
cd nginx/ && git remote set-url origin git@github.com:knosc/platform-nginx.git ; cd ..
cd nginx-test/ && git remote set-url origin git@github.com:knosc/platform-nginx-test.git ; cd ..
cd postgres/ && git remote set-url origin git@github.com:knosc/platform-postgres.git ; cd ..
cd rest-api/ && git remote set-url origin git@github.com:knosc/platform-rest-api.git ; cd ..
cd tests/ && git remote set-url origin git@github.com:knosc/platform-tests.git ; cd ..
cd unit-tests/ && git remote set-url origin git@github.com:knosc/platform-python-tests.git ; cd ..
git submodule foreach 'git checkout development && git pull'
```
