function Color(color)
  if color then
      vim.cmd.colorscheme(color)
  else
    require('onedark').setup {
      style = 'warmer'
    }

    require('onedark').load()
  end

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color("catppuccin")
