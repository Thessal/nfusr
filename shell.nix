{
  pkgs ? import <nixpkgs> { },
}:
pkgs.callPackage (
  {
    mkShell,
  }:
  mkShell {
    packages = [
       #(import ./default.nix)
       (import (builtins.fetchGit { url = "https://github.com/Thessal/nfusr"; ref = "master"; rev = "8fcb5e1e36f6ad80da0b6205a6ef625153185bae";}))
    ];
    shellHook = ''
       # mount.nfusr nfs://ip/dir /mnt
    '';
  }
) { }
