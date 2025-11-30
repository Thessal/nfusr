{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage (
  {
    mkShell,
  }:
  mkShell {
    packages = [
       (import ./default.nix)
       # or replace it with (builtins.fetchGit { url = "https://github.com/Thessal/nfusr"; ref = "main"; rev = "commit-hash";)
  }) {};

    ];
  }
) { }
