require("lze").register_handlers(require("lzextras").lsp)
require("lze").h.lsp.set_ft_fallback(
    function(name)
        return dofile(nixCats.pawsible({ "allPlugins", "opt", "nvim-lspconfig" }) .. "/lsp/" .. name .. ".lua").filetypes
            or {}
    end
)

require("lze").load({
    require("plugins/oil"),
    require("plugins/terminal"),
    require("plugins/conform"),
    require("plugins/which-key"),
    require("plugins/snacks"),
    require("plugins/lsp"),
    require("plugins/treesitter"),
    require("plugins/lualine"),
    require("plugins/cmp"),
    require("plugins/colorscheme"),
    require("plugins/aerial"),
    require("plugins/comments"),
    require("plugins/plenary"),
    require("plugins/startuptime"),
    require("plugins/mini"),
    require("plugins/git"),
    --   require 'plugins/dap',
})
