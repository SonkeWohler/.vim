-----------------------------------------------------------------------
---   hydras are awesome, they have their own lua file in my setup  ---
--- unfortunately, they are mostly awesome in theory.  Not sure why ---
-----------------------------------------------------------------------
--- TODO move all the hydra logic here, if I can.


return {

  -- hydras are awesome, they have their own lua file in my setup
  -- unfortunately, they are mostly awesome in theory.  Not sure why
  {
    'anuvyklack/hydra.nvim',
    event = "VeryLazy",
    dependencies = 'anuvyklack/keymap-layer.nvim' -- needed only for pink hydras
  },


}
