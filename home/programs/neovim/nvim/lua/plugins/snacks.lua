local M = {
    "snacks.nvim",
    opts = {
        picker = { enabled = true },
        quickfile = { enabled = true },
    },
    keys = {
        -- commonly used
        { "<leader><leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        -- undo
        { "<leader>u", function() Snacks.picker.undo() end, desc = "Toggle [U]ndotree" },
        -- aerial
        { "<leader>o", function() require("aerial").snacks_picker() end, desc = "Code [O]utline" },
        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "[F]ind [B]uffers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "[F]ind [F]iles" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "[F]ind [G]it Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "[F]ind [P]rojects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "[F]ind [R]ecent" },
        -- search grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "[S]earch [B]uffer" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "[S]earch Open [B]uffers" },
        { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch [G]rep" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch [W]ord" },
        -- general search
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
        { "<leader>sD", function() Snacks.picker.diagnostics() end, desc = "[S]earch Buffer [D]iagnostics" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "[S]earch [J]umps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "[S]earch [L]ocation List" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[S]earch [Q]uickfix List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "[S]earch [M]arks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "[S]earch [M]an Pages" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp Pages" },
        { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "[S]earch [T]odos" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "[G]it [B]ranches" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "[G]it [D]iff" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "[G]it [S]tatus" },
        { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[G]it [L]og" },
        { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "[G]it [L]og Line" },
        -- lsp
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto [D]efinition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "[G]oto [D]eclaration" },
        { "gr", function() Snacks.picker.lsp_references() end, desc = "[G]oto [R]eferences" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [I]mplementation" },
        { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "[G]oto [T]ype Definition" },
    },
}

return M
