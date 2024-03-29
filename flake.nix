# in flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
    # rust-overlay.url = "github:oxalica/rust-overlay";
  };
  outputs = { self, nixpkgs, flake-utils }: # rust-overlay
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          # overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs {
            inherit system; # overlays;
          };
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [ 
              zola
              nodejs
              yarn # https://www.printlnhello.world/blog/zola-tailwindcss/
            ];
          };
        }
      );
}
