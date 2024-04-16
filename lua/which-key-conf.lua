local wk = require("which-key")

wk.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
    },
    motions = {
        count = true,
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000, -- positive value to position WhichKey above other floating windows.
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
    show_help = true, -- show a help message in the command line for using WhichKey
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specifiy a list manually
    -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
    triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
    },
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for keymaps that start with a native binding
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by default for Telescope
    disable = {
        buftypes = {},
        filetypes = {},
    },
}

--TODO: General and Buffer Bindings for quick switching

--TODO: Telescope bindings and File Bindings
wk.register({
    f = {
        name = "file", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        n = { "New File" }, -- just a label. don't create any mapping
    --      e = "Edit File", -- same as above
    --      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --      b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
}, { prefix = "<leader>" })

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--TODO: gitsigns & Neogit bindings:
wk.register({
    g = {
        name = "Git", -- optional group name
        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        n = { "New File" }, -- just a label. don't create any mapping
    --      e = "Edit File", -- same as above
    --      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --      b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
}, { prefix = "<leader>" })


map('n', '<leader>hs', gitsigns.stage_hunk)
map('n', '<leader>hr', gitsigns.reset_hunk)
map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
map('n', '<leader>hS', gitsigns.stage_buffer)
map('n', '<leader>hu', gitsigns.undo_stage_hunk)
map('n', '<leader>hR', gitsigns.reset_buffer)
map('n', '<leader>hp', gitsigns.preview_hunk)
map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
map('n', '<leader>hd', gitsigns.diffthis)
map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
map('n', '<leader>td', gitsigns.toggle_deleted)
-- :Neogit <--show main window
-- :Neogit log <-- show log window
-- :Neogit commit <-- show commit window

--Neotree bindings
wk.register({
    t = {
        name = "NeoTree", -- optional group name
        t = { "<cmd>Neotree source=filesystem position=left focus<cr>", "Open Explorer" }, -- create a binding with label
        x = { "<cmd>Neotree close<cr>", "Close Explorer", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        b = { "<cmd>Neotree source=buffers position=float focus" }, -- just a label. don't create any mapping
    --      e = "Edit File", -- same as above
    --      ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    --      b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },
}, { prefix = "<leader>" })

-- Finished:
wk.register({
    x = {
        name = "Trouble",
        x = { function() require("trouble").toggle() end, "Toogle Trouble" }, -- create a binding with label
        w = { function() require("trouble").toggle("workspace_diagnostics") end, "Workspace Diagnostics" }, -- additional options for creating the keymap
        d = { function() require("trouble").toggle("document_diagnostics") end, "Document Diagnostics" }, -- just a label. don't create any mapping
        q = { function() require("trouble").toggle("quickfix") end, "Quick Fix"}, -- same as above
        l = { function() require("trouble").toggle("loclist") end, "LocList"},  -- special label to hide it in the popup
        g = { function() require("trouble").toggle("lsp_references") end, "LSP Reference" } -- you can also pass functions!
    },
}, { prefix = "<leader>" })
