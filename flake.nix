{
  description = "Caboo TUI game";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
          system: function nixpkgs.legacyPackages.${system}
        );
    in
    {
      packages = forAllSystems (pkgs: {
        caboo = pkgs.callPackage ./nix/default.nix { version = self.shortRev or "unstable"; };
        default = self.packages.${pkgs.stdenv.hostPlatform.system}.caboo;
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/shell.nix { };
      });

      overlays.default = final: _: { 
        caboo = final.callPackage ./nix/default.nix { version = self.shortRev or "unstable"; };
      };
    };
}
