local function lsp_on_attach(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
end

local M = {
    {
        "nvim-lspconfig",
        enabled = nixCats("general") or false,
        on_require = { "lspconfig" },
        lsp = function(plugin)
            vim.lsp.config(plugin.name, plugin.lsp or {})
            vim.lsp.enable(plugin.name)
        end,
        before = function(_)
            vim.lsp.config("*", {
                on_attach = lsp_on_attach,
            })
        end,
    },
    {
        "clangd",
        enabled = nixCats("c") or false,
        lsp = {
            filetypes = { "c", "cpp", "objc", "objcpp" },
            on_attach = lsp_on_attach,
        },
    },
    {
        "lua_ls",
        enabled = nixCats("lua") or false,
        lsp = {
            filetypes = { "lua" },
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    formatters = {
                        ignoreComments = true,
                    },
                    signatureHelp = { enabled = true },
                    diagnostics = {
                        globals = { "nixCats", "vim", "Snacks" },
                        disable = { "missing-fields" },
                    },
                    telemetry = { enabled = false },
                },
            },
        },
    },
    {
        "nixd",
        enabled = nixCats("nix") or false,
        lsp = {
            filetypes = { "nix" },
            settings = {
                nixd = {
                    -- nixd requires some configuration.
                    -- luckily, the nixCats plugin is here to pass whatever we need!
                    -- we passed this in via the `extra` table in our packageDefinitions
                    -- for additional configuration options, refer to:
                    -- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
                    nixpkgs = {
                        -- in the extras set of your package definition:
                        -- nixdExtras.nixpkgs = ''import ${pkgs.path} {}''
                        expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
                    },
                    options = {
                        nixos = {
                            -- nixdExtras.nixos_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").nixosConfigurations.configname.options''
                            expr = nixCats.extra("nixdExtras.nixos_options"),
                        },
                        ["home-manager"] = {
                            -- nixdExtras.home_manager_options = ''(builtins.getFlake "path:${builtins.toString inputs.self.outPath}").homeConfigurations.configname.options''
                            expr = nixCats.extra("nixdExtras.home_manager_options"),
                        },
                    },
                    formatting = {
                        command = { "alejandra" },
                    },
                },
            },
        },
    },
    {
        "rust_analyzer",
        enabled = nixCats("rust") or false,
        lsp = {
            on_attach = lsp_on_attach,
        },
    },
    {
        "hls",
        enabled = nixCats("haskell") or false,
        lsp = {},
    },
}

return M
