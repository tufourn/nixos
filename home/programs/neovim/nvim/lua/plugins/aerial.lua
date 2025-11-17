local M = {
    "aerial.nvim",
    enabled = nixCats("general") or false,
    after = function() require("aerial").setup({}) end,
}

return M
