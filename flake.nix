{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    src = {
      url = "https://ftp.icm.edu.pl/pub/unix/kde/unstable/ktechlab/ktechlab-0.50.0.tar.xz";
      flake = false;
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system: {
        name = system;
        value = with import nixpkgs { inherit system; config.allowUnfree = true; }; rec {
          ktechlab = pkgs.callPackage (import ./package/default.nix) { pname = "ktechlab"; version = "0.50.0"; src = inputs.src; };
          default = ktechlab;
        };
    })[ "x86_64-linux" ]);
  };
}
