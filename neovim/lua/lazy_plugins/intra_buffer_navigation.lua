--------------------------------------------
---     navigating within the buffer     ---
--- e.g. word to word, lines, paragraphs ---
---                  etc.                ---
--------------------------------------------

return {

    -- better word based movement
    {
      "chrisgrieser/nvim-spider",
      event = "VeryLazy",
    },
    -- I use this in mappings.lua, to keep all the mapping related stuff in one
    -- place.  This makes them easier to extend, at the cost of getting errors
    -- during refactoring.



}
