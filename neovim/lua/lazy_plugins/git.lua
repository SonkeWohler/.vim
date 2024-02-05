-----------
--- git ---
-----------

return{

    -- in line git display
    {
      'lewis6991/gitsigns.nvim',
      event = "VeryLazy",
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },
    -- used in mappings.lua, where I keep all commands to make them easier
    -- to extend, at the cost of refactoring involving some more errors

    -- view git messages
    {
      'rhysd/git-messenger.vim',
      event = "VeryLazy",
      config = function()
        vim.g.git_messenger_no_default_mappings = false
        nmap('gm', '<Plug>(git-messenger)')
      end,
    },

}
