--@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}


M.folding = {
  n = { 
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
     "Open all folds",
    },

    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
     "Close all folds",
    },

    ["zr"] = {
      function()
        require("ufo").openFoldsExceptKinds()
      end,
     "Close all folds",
    },

    ["zm"] = {
      function()
        require("ufo").closeFoldsWith()
      end,
     "Close all folds",
    },
    
  }
}

M.crates ={
  n ={
    ["<leader>rcu"] ={
      function ()
        require("crates").upgrade_all_crates()
      end,
      "Upgrade all crates"
    }
  }
}

-- more keybinds!

return M
