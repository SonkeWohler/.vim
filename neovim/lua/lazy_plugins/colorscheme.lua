return {

  {
    'ribru17/bamboo.nvim',
    event = "VeryLazy",
    config = function()
      require('bamboo').setup {}
      require('bamboo').load()
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#252623 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2f312c gui=nocombine]]
      vim.cmd [[ colorscheme bamboo ]]
    end
  },

}
