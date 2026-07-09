{
  description = "Python language development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
      devShells."x86_64-linux".default = pkgs.mkShell {
        buildInputs = with pkgs; [
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
    };
}
