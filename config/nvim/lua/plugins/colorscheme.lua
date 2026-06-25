return {
    {
        "rmehri01/onenord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onenord").setup({
                options = {
                    transparent = true;
                },
            })
            vim.cmd.colorscheme("onenord")
        end,
    },
    
  -- tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onenord",
    },
  },
}
