{ lib, inputs, system, home-manager, username, ...}:

{
    laptop = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs username; };
      modules = [ 
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${username} = {
            imports = [(import ./home.nix)];
          };
        }
      ];
    };
}