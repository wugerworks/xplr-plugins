{
  perSystem = { 
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        just
        nvfetcher
      ];
      name = "nvfetcher repo";
    };
  };
}
