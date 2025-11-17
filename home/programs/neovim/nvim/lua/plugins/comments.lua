local M = {
    {
        "comment.nvim",
        enabled = nixCats("general") or false,
        keys = {
            "gcc",
            "gc",
            "gbc",
            "gb",
            "gco",
            "gcO",
            "gcA",
        },
        after = function() require("Comment").setup() end,
    },
    {
        "todo-comments.nvim",
        enabled = nixCats("general") or false,
        event = {
            "BufReadPre",
            "BufNewFile",
        },
        after = function()
            require("todo-comments").setup({
                signs = false,
            })
        end,
    },
}

return M
