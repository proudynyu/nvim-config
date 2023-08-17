local wk = require("which-key")

wk.register({
    p = {
        name = "Files",
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        s = { "<cmd>Telescope grep_string<cr>", "Grep String" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        v = { "<cmd>Ex<cr>", "Open Vim Tree" },
        t = { "<cmd>Prettier<cr>", "Prettier" },
        e = { "<cmd>Neotree toggle reveal float<cr>", "Toogle Neotree" },
        b = { "<cmd>Neotree toggle buffers float<cr>", "Toogle Neotree Buffers" }
    },
    u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
    g = {
        name = "Git/Comment",
        s = { "<cmd>Git<cr>", "Git" },
        l = { "<cmd>Git log<cr>", "Git Log" },
        c = { "Comment Line" },
        cc = { "UnComment Line" }
    },
    y = { "Copy" },
    s = { "Change Word Globally" }
}, { prefix = "<leader>" })
