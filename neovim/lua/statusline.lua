-----------------------------------------------------------------
----               this was taken from here                  ----
---- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html ----
-----------------------------------------------------------------

--- map the codes for each mode to the display text
local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}
--- get vim mode and format to display text
local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

-- TODO
-- mode colours

--- get filepath and format to display text
local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

--- get filename and format to display text
local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

--- get LSP info and format to display text
local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

--- get filetype and format to display text
local function filetype()
  return string.format(" %s ", vim.bo.filetype)
end

--- get line and colum info and format to display text
local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %l/%L : %c%V %P"
end

---------------------------------------------------
------      assemble the statusline        -------
---------------------------------------------------

Statusline = {}

--- default for the active window
Statusline.active = function()
  return table.concat {
    "%#Statusline#",
    mode(),
    filepath(),
    filename(),
    lsp(),
    "%=%#StatusLineExtra#",
    filetype(),
    lineinfo(),
  }
end

--- default for any inactive buffers
function Statusline.inactive()
  return table.concat {
    "%#Statusline#",
    "%#Normal# ",
    filepath(),
    filename(),
    lsp(),
    "%=",
    "%#Statusline#",
    filetype(),
    lineinfo(),
  }
end

--- when no lsp
function Statusline.nolsp()
  return table.concat {
    "%#Statusline#",
    mode(),
    "%#Normal# ",
    filepath(),
    filename(),
    "%#Normal#",
    "%=%#StatusLineExtra#",
    filetype(),
    lineinfo(),
  }
end

--- minimalist for tree etc
function Statusline.short()
  return "%#StatusLineNC#   NvimTree"
end

---------------------------------------------------
------        activate statusline           -------
---------------------------------------------------

--- augroups to activate the statuline
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
