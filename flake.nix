{
  description = "My first config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
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
        user = "${username}";
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit system lib;
          inherit inputs nixpkgs home-manager username;
        }
      );
    };
}
