{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs; [
    harpoon
  ];

  lua = ''
    require("harpoon").setup({
    	menu = {
    		width = vim.api.nvim_win_get_width(0) - 4,
    	}
    })
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<C-a>", mark.add_file, {})
    vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)

    require('telescope').load_extension('harpoon')
  '';

}
