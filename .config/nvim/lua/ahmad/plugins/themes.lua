return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            -- Default options:
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = false,
                italic = {
                    strings = true,
                    emphasis = false,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = true,
                inverse = true,    -- invert background for search, diffs, statuslines and errors
                contrast = "hard", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {
                    -- Function = { fg = "#ebdbb2" },
                    -- Function = { fg = "#8ec07c" },
                    SignColumn = { bg = "NONE" },
                    Normal = { bg = "NONE" },
                },
                dim_inactive = false,
                transparent_mode = false,
            })
            vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            require("onedark").setup({
                -- Main options --
                style = "darker",         -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                transparent = true,       -- Show/hide background
                term_colors = true,       -- Change terminal color as per the selected theme style
                ending_tildes = false,    -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- toggle theme style ---
                toggle_style_key = nil,                                                          -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
                toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },

                -- Lualine options --
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },

                -- Custom Highlights --
                colors = {}, -- Override default colors
                highlights = {
                    -- Normal = { bg = "#16181A" },
                }, -- Override highlight groups

                -- Plugins Config --
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true, -- use undercurl instead of underline for diagnostics
                    background = true, -- use background color for virtual text
                },
            })
            -- vim.cmd("color onedark")
        end,
    },
}
