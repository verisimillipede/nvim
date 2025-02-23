--          ╔═════════════════════════════════════════════════════════╗
--          ║                       CopilotChat                       ║
--          ╚═════════════════════════════════════════════════════════╝

-- ══ TODO: ═══════════════════════════════════════════════════════════
--
-- - [ ] Need access to the rest of the commands
-- - [ ] Copilot autocomplete <tab> does not work within the chat
-- - [ ]

return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        enable = false,
        branch = "main",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        event = "VeryLazy",
        opts = {
            show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
            debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
            disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
            language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
            -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
            -- temperature = 0.1,
        },
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        config = function()
            require("CopilotChat").setup({
                auto_insert_mode = true,
                show_help = true,
                show_folds = false,
                question_header = "  Mike ",
                answer_header = "  Copilot ",
                window = {
                    layout = "float",
                    width = 0.6,
                    height = 0.7,
                    border = "rounded",
                    zindex = 100,
                },
                mappings = {
                    close = {
                        normal = "q",
                        insert = "C-c",
                    },
                    reset = {
                        normal = '<C-r>',
                        insert = '<C-r>',
                    },
                    accept_diff = {
                        normal = '<C-y>',
                        insert = '<C-y>',
                    },
                    yank_diff = {
                        normal = 'gy',
                        register = '"',
                    },
                    show_diff = {
                        normal = 'gd',
                    },
                    show_info = {
                        normal = 'gp',
                    },
                },
                selection = function(source)
                    local select = require("CopilotChat.select")
                    return select.visual(source) or select.buffer(source)
                end,
            })
        end,
        keys = {
            { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
            { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
            { "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix" },
            { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", desc = "CopilotChat - Optimize" },
            { "<leader>ccd", "<cmd>CopilotChatDocs<cr>", desc = "CopilotChat - Add Documentation" },
            { "<leader>ccT", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
            { "<leader>ccD", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix diagnostic issue in file" },
            { "<leader>ccc", "<cmd>CopilotChatCommit<cr>", desc = "CopilotChat - Commit message" },
            { "<leader>ccs", "<cmd>CopilotChatCommitStaged<cr>", desc = "CopilotChat - Commit staged changes" },
            { "<leader>cct", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
        },
    },
}
