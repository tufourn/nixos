local M = {
    "which-key.nvim",
    enabled = nixCats("general") or false,
    event = "DeferredUIEnter",
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
    after = function() require("which-key").setup({}) end,
}

return M
