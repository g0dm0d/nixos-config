{
  description = "My first config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = github:nix-community/home-manager/release-22.11;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager }: 
  let
    username = "godmod";
    system = "x86_x64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      user = "godmod";
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = (
      import ./hosts {
        inherit system lib;
        inherit inputs nixpkgs home-manager username;
      }
    );
  };
}
