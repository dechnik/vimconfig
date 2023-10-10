{ pkgs, dsl, ... }:
with dsl; {
  plugins = with pkgs; [
    sg-nvim
  ];

  lua = ''
    require("sg").setup {}
  '';

}
