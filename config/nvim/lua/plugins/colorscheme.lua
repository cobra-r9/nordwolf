return {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("nord").setup({})
            vim.cmd.colorscheme("nord")
        end,
    },
    
  -- tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
