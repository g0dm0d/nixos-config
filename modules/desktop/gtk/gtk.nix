{ gtk, pkgs, ... }:

{
  gtk = {
    enable = true;
    font.name = "Cantarell Bold 12";
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };
}
