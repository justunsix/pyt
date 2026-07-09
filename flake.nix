{
  description = "Python language development flake";
  # Template https://github.com/NixOS/templates/blob/master/python/flake.nix

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShell =
          with pkgs;
          mkShell {
            buildInputs = [
              # Main program
              python3
              # Package and environment manager
              uv
              # LSP and Type Checker
              ty
              # Linter, code formatter
              ruff
              # Other dependencies
              # glib
            ];
            # Expose dependencies declared above
            nativeBuildInputs = [ pkgs.pkg-config ];
          };
      }
    );
}
