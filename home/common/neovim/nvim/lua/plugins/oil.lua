local M = {
    "oil.nvim",
    enabled = nixCats("general") or false,
    load = function(name) vim.cmd.packadd(name) end,
    after = function()
        require("oil").setup()
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}

return M
