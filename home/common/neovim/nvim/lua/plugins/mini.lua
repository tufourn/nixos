local M = {
    "mini.nvim",
    enabled = nixCats("general") or false,
    event = "DeferredUIEnter",
    after = function(plugin)
        require("mini.ai").setup()
        require("mini.surround").setup()
        require("mini.icons").setup()
    end,
}

return M
