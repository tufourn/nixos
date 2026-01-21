local M = {
    "lualine.nvim",
    enabled = nixCats("general") or false,
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    load = function(name)
        vim.cmd.packadd(name)
        vim.cmd.packadd("lualine-lsp-progress")
    end,
    after = function(plugin)
        require("lualine").setup({
            options = {
                icons_enabled = false,
                -- theme = "onedark",
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    {
                        "filename",
                        path = 1, -- Relative path
                        shorting_target = 40,
                        file_status = true,
                        symbols = {
                            modified = "[+]",
                            readonly = "[-]",
                            unnamed = "[No Name]",
                            newfile = "[New]",
                        },
                    },
                    "lsp_progress",
                },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}

return M
