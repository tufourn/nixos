local M = {
    "aerial.nvim",
    enabled = nixCats("general") or false,
    dep_of = "snacks.nvim",
    after = function() require("aerial").setup({}) end,
}

return M
