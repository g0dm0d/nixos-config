{ config, lib, pkgs, ... }:

{
  imports = [
    ../waybar/waybar.nix
    ../wofi/wofi.nix
    ../dunst/dunst.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    swappy
    wl-clipboard
    wlr-randr
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/wallpaper.png".source = ./wallpaper.png;

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"
      "HDMI-A-1,2560x1080@200,0x0,1"
      "eDP-1,1920x1080@60,320x1080,1"
    ];

    exec-once = [
      "waybar"
      "hyprpaper"
    ];

    decoration = {
      shadow_offset = "0 5";
      "col.shadow" = "rgba(00000099)";
      rounding = 5;
    };

    animations = {
      enabled = 1;
      animation = [
        "workspaces,1,3,default"
        "border,1,5,default"
        "windows,1,3,default"
        "fade,1,5,default"
      ];
    };

    input = {
      kb_file = "";
      kb_layout = "us,ru";
      kb_variant = "ffffff";
      kb_model = "";
      kb_options = "grp:alt_shift_toggle";
      kb_rules = "";

      follow_mouse = 1;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        clickfinger_behavior = true;
      };
    };

    "$mod" = "SUPER";

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    binde = [
      ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ];

    bind = [
      "$mod,RETURN,exec,kitty"
      "$mod,Q,killactive,"
      "$mod,M,exit,"
      "$mod,W,exec,MOZ_ENABLE_WAYLAND=1 firefox"
      "$mod,N,exec,nemo"
      "$mod,S,togglefloating,"
      "$mod,F,fullscreen,"
      "$mod,D,exec,wofi"
      "$mod,P,pseudo,"
      ",Print,exec, grim -g \"$(slurp)\" - | wl-copy"

      "$mod,left,movefocus,l"
      "$mod,right,movefocus,r"
      "$mod,up,movefocus,u"
      "$mod,down,movefocus,d"

      "$mod,mouse_down,workspace,e+1"
      "$mod,mouse_up,workspace,e-1"

      ",XF86MonBrightnessUp,exec,brightnessctl s +1%"
      ",XF86MonBrightnessDown,exec,brightnessctl s 1%-"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
      builtins.concatLists (builtins.genList
        (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "alt, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
    );

    windowrule = [
      "move center,title:^(kitty)$"
      "size 600 300,title:^(kitty)$"
    ];
  };
}
