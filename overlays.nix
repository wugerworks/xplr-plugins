{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {config, pkgs, ...}: 
  {
    overlayAttrs = {
      xplr-plugins = builtins.mapAttrs (_: p: p.src) (
          (import ./sources/generated.nix) {
            inherit (pkgs) fetchurl fetchgit fetchFromGitHub dockerTools;
          }
        );
    };
  };
}
