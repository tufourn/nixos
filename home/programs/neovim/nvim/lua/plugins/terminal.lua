local M = {
    "FTerm.nvim",
    enabled = nixCats("general") or false,
    keys = { "<C-\\>", desc = "Toggle Terminal" },
    after = function()
        local fterm = require("FTerm")
        vim.keymap.set("n", "<C-\\>", function() fterm:toggle() end, { desc = "Toggle Terminal" })
        vim.keymap.set("t", "<C-\\>", function() fterm:toggle() end, { desc = "Toggle Terminal" })
    end,
}

return M
