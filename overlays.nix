{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {config, pkgs, ...}: let 
    generated = import ./sources/generated.nix;
  in {
    overlayAttrs = {
      xplr-plugins = generated {
        inherit (pkgs) fetchurl fetchgit fetchFromGitHub dockerTools;
      };
    };
  };
}
