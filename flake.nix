{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    utils,
  }: (utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
      fonts = pkgs.symlinkJoin {
        name = "font-package";
        paths = with pkgs; [
          work-sans
          liberation_ttf
        ];
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          typst
        ];

        TYPST_FONT_PATHS = "${fonts}";
      };
    }));
}
