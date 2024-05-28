{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {config, pkgs, ...}: let
    mkOverlayAttr = name: value: pkgs.callPackage value; 
    generated = import ./sources/generated.nix;
  in {
    overlayAttrs.xplr-plugins = builtins.mapAttrs mkOverlayAttr generated {
        inherit (pkgs) fetchurl fetchgit fetchFromGitHub dockerTools;
      };
  };
}
