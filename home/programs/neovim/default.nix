{
  config,
  lib,
  inputs,
  ...
}: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      enable = true;
      luaPath = ./nvim/.;
      packageNames = ["NvimModule"];
      categoryDefinitions.replace = {
        pkgs,
        settings,
        categories,
        extra,
        name,
        mkPlugin,
        ...
      } @ packageDef: {
        lspsAndRuntimeDeps = {
          general = with pkgs; [
            ripgrep
            fd
            tree-sitter
          ];
          c = with pkgs; [
            clang-tools
            valgrind
            gcc
            gdb
          ];
          lua = with pkgs; [
            lua-language-server
            stylua
          ];
          nix = with pkgs; [
            nixd
            alejandra
          ];
          rust = with pkgs; [
            rust-analyzer
            rustfmt
          ];
          haskell = with pkgs; [
            haskell-language-server
            ormolu
          ];
        };

        startupPlugins = {
          general = with pkgs.vimPlugins; [
            lze
            lzextras
            snacks-nvim
            vim-sleuth
            github-nvim-theme
          ];
        };

        optionalPlugins = {
          lua = with pkgs.vimPlugins; [
            lazydev-nvim
          ];
          general = with pkgs.vimPlugins; [
            todo-comments-nvim
            comment-nvim
            plenary-nvim
            oil-nvim
            FTerm-nvim
            conform-nvim
            which-key-nvim
            nvim-lspconfig
            blink-cmp
            nvim-treesitter.withAllGrammars
            lualine-nvim
            lualine-lsp-progress
            aerial-nvim
            vim-startuptime
            mini-nvim

            gitsigns-nvim
            nvim-lint
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
          ];
        };
      };

      packageDefinitions.replace = {
        NvimModule = {
          pkgs,
          name,
          ...
        }: {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            aliases = ["nvim"];
          };
          categories = {
            general = true;
            c = true;
            lua = true;
            nix = true;
            rust = true;
            haskell = true;
          };
        };
      };
    };
  };
}
