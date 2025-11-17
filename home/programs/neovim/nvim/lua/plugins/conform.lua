local M = {
    {
        "conform.nvim",
        enabled = nixCats("general") or false,
        keys = {
            "<leader>F",
            desc = "[F]ormat buffer",
        },
        event = "BufWritePre",
        cmd = "ConformInfo",
        after = function(plugin)
            local conform = require("conform")

            conform.setup({
                notify_on_error = false,
                formatters_by_ft = {
                    lua = nixCats("lua") and { "stylua" } or nil,
                    nix = nixCats("nix") and { "alejandra" } or nil,
                    rust = nixCats("rust") and { "rustfmt" } or nil,
                },
                format_on_save = function(bufnr)
                    local disable_filetypes = { c = true, cpp = true }
                    if disable_filetypes[vim.bo[bufnr].filetype] then
                        return nil
                    else
                        return {
                            timeout_ms = 500,
                            lsp_format = "fallback",
                        }
                    end
                end,
            })

            vim.keymap.set(
                { "n", "v" },
                "<leader>F",
                function()
                    conform.format({
                        lsp_fallback = true,
                        async = false,
                        timeout_ms = 1000,
                    })
                end,
                { desc = "[F]ormat Buffer" }
            )
        end,
    },
}

return M
