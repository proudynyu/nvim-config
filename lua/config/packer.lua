-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colors
    use 'navarasu/onedark.nvim'
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'luisiacc/gruvbox-baby'
    use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'neanias/everforest-nvim'
    use 'water-sucks/darkrose.nvim'

    -- Colors for Hex
    use 'norcalli/nvim-colorizer.lua'

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')


    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'ryanoasis/vim-devicons'

    use {
        "prettier/vim-prettier",
        run = "yarn install --frozen-lockfile --production",
        branch = "release/0.x"
    }

    use {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
           require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    }

      use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

      use "MunifTanjim/nui.nvim"
      use "nvim-lua/plenary.nvim"
      use "nvim-tree/nvim-web-devicons"

      use {
          "nvim-neo-tree/neo-tree.nvim",
          version = "*",
          dependencies = {
              "nvim-lua/plenary.nvim",
              "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
          },
      }

      use {
          "folke/which-key.nvim",
          config = function()
              vim.o.timeout = true
              vim.o.timeoutlen = 300
              require("which-key").setup {}
          end
      }
      use {
          'feline-nvim/feline.nvim',
          branch = '0.5-compat'
      }

end)

