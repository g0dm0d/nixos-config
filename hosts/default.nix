{ lib, inputs, system, home-manager, username, hyprland, ...}:

{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username hyprland; };
    modules = [ 
      hyprland.nixosModules.default
      { programs.hyprland.enable = true; }
      ./laptop/configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username} = {
          imports = [(import ./laptop/home.nix)];
        };
      }
    ];
  };

  server = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs username; };
    modules = [ 
      ./server/configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit username; };
        home-manager.users.${username} = {
          imports = [(import ./server/home.nix)];
        };
      }
    ];
  };
}