{ lib, inputs, system, home-manager, username, hyprland, ...}:

{
    laptop = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs username hyprland; };
      modules = [ 
        hyprland.nixosModules.default
        { programs.hyprland.enable = true; }
        ./configuration.nix

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit username; };
          home-manager.users.${username} = {
            imports = [(import ./home.nix)];
          };
        }
      ];
    };
}