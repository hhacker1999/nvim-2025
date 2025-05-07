local M = {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
    lazy = false,
    cmd = "Telescope",
}

function M.config()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
        keymap("n", "<leader>fb", "<cmd>Telescope buffers previewer=false<cr>", opts)
        keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>",opts)
        keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts)
        keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", opts)
        -- ["<leader>le"] = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        -- ["<leader>ad"] = { "<cmd>Telescope diagnostics<cr>", "Commands" },

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
            vim.api.nvim_buf_call(ctx.buf, function()
                vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
            end)
        end,
    })

    local icons = require "plugins.icons.icons"
    local actions = require "telescope.actions"

    local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then
            return tail
        end
        return string.format("%s\t\t%s", tail, parent)
    end

    require("telescope").setup {
        defaults = {
            prompt_prefix = icons.ui.Telescope .. " ",
            selection_caret = icons.ui.Forward .. " ",
            entry_prefix = "   ",
            initial_mode = "insert",
            selection_strategy = "reset",
            path_display = { "smart" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            sorting_strategy = nil,
            layout_strategy = nil,
            layout_config = {},
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = {
                theme = "dropdown",
            },

            grep_string = {
                theme = "dropdown",
            },

            find_files = {
                theme = "dropdown",
                previewer = false,
                path_display = filenameFirst,
            },

            buffers = {
                theme = "dropdown",
                previewer = false,
                initial_mode = "insert",
                mappings = {
                    i = {
                        ["<C-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = {
                enable_preview = true,
            },

            lsp_references = {
                theme = "dropdown",
                initial_mode = "insert",
            },

            diagnostics = {
                theme = "dropdown",
                initial_mode = "insert",
            },

            lsp_definitions = {
                theme = "dropdown",
                initial_mode = "insert",
            },

            lsp_declarations = {
                theme = "dropdown",
                initial_mode = "insert",
            },

            lsp_implementations = {
                theme = "dropdown",
                initial_mode = "insert",
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,           -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    }
end

return M
