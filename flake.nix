{
  description = "Lisp packages not included in nixpkgs.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    utils.url = "github:numtide/flake-utils";

    agnostic-lizard = {
      url = "https://gitlab.common-lisp.net/mraskin/agnostic-lizard.git";
      flake = false;
    };
    arrows = {
      url = "https://gitlab.com/Harleqin/arrows.git";
      flake = false;
    };
    cl-sasl = {
      url = "github:legoscia/cl-sasl";
      flake = false;
    };
    fare-mop = {
      url = "github:fare/fare-mop";
      flake = false;
    };
    file-types = {
      url = "github:eugeneia/file-types";
      flake = false;
    };
    inferior-shell = {
      url = "github:fare/inferior-shell";
      flake = false;
    };
    ip-utils = {
      url = "https://fudo.dev/publc/ip-utils.git";
      flake = false;
    };
    oscicat = {
      url = "github:osicat/osicat";
      flake = false;
    };
    sly = {
      url = "github:joaotavora/sly";
      flake = false;
    };
    sly-asdf = {
      url = "github:mmgeorge/sly-asdf";
      flake = false;
    };
    sly-macrostep = {
      url = "github:joaotavora/sly-macrostep";
      flake = false;
    };
    sly-stepper = {
      url = "github:joaotavora/sly-stepper";
      flake = false;
    };
    usocket = {
      url = "github:usocket/usocket";
      flake = false;
    };
    xml-emitter = {
      url = "github:VitoVan/xml-emitter";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, utils, ... }@inputs:
    (utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in pkgs.callPackage ./packages.nix { inherit inputs; })) // {
        overlays = rec {
          default = packages;
          packages = (final: prev: {
            lispPackages = prev.lispPackages // self.packages."${prev.system}";
          });
        };

        nixosModules = rec {
          default = packages;
          packages = { ... }: {
            config.nixpkgs.overlays = [ self.overlays.packages ];
          };
        };
      };
}
