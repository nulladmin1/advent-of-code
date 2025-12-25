{
  description = "AOC2025";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = {
    self,
    nixpkgs,
    systems,
    ...
  }: let
    forEachSystem = f:
      nixpkgs.lib.genAttrs (import systems) (system:
        f {
          pkgs = import nixpkgs {
            inherit system;
          };
        });
  in {
    formatter = forEachSystem ({pkgs, ...}: pkgs.alejandra);

    devShells = forEachSystem ({pkgs, ...}: {
      default = pkgs.mkShell {
        packages =
          (with pkgs; [
            ocaml
            ocamlformat
          ])
          ++ (with pkgs.ocamlPackages; [
            dune_3
            odoc
            ocaml-lsp
          ]);
      };
    });

    packages = forEachSystem ({pkgs, ...}: {
      default = pkgs.hello;
    });

    apps = forEachSystem ({pkgs, ...}: {
      default = {
        type = "app";
        program = "${self.packages.${pkgs.system}.default}/bin/hello";
      };
    });
  };
}
