{ inputs, lispPackages, ... }:

let inherit (lispPackages) buildLispPackage;
in rec {
  agnostic-lizard = buildLispPackage {
    baseName = "agnostic-lizard";
    packageName = "agnostic-lizard";
    description =
      "Agnostic Lizard is a portable implementation of a code walker and in particular of the macroexpand-all function (and macro) that makes a best effort to be correct while not expecting much beyond what the Common Lisp standard requires.";

    buildSystems = [ "agnostic-lizard" ];

    deps = [ ];

    src = inputs.agnostic-lizard;

    asdFilesToKeep = [ "agnostic-lizard.asd" ];
  };

  arrows = buildLispPackage {
    baseName = "arrows";
    packageName = "arrows";
    description = "Clojure-style arrows for Common Lisp";

    buildSystems = [ "arrows" ];

    deps = [ ];

    src = inputs.arrows;

    asdFilesToKeep = [ "arrows.asd" ];
  };

  cl-sasl = buildLispPackage {
    description = "SASL package for common lisp";
    baseName = "cl-sasl";
    packageName = "cl-sasl";

    buildSystems = [ "cl-sasl" ];

    deps = with lispPackages; [ ironclad ];

    src = inputs.cl-sasl;

    asdFilesToKeep = [ "cl-sasl.asd" ];
  };

  fare-mop = buildLispPackage {
    baseName = "fare-mop";
    packageName = "fare-mop";
    description = "fare-mop has a few simple utilities relying on the MOP.";

    buildSystems = [ "fare-mop" ];

    deps = with lispPackages; [ closer-mop fare-utils ];

    src = inputs.fare-mop;

    asdFilesToKeep = [ "fare-mop.asd" ];
  };

  file-types = buildLispPackage {
    baseName = "file-types";
    packageName = "file-types";
    description =
      "Simple scheme to classify file types in a hierarchical fashion. Includes support for associating and querying MIME types.";

    buildSystems = [ "file-types" ];

    deps = [ ];

    src = inputs.file-types;

    asdFilesToKeep = [ "file-types.asd" ];
  };

  inferior-shell = buildLispPackage {
    baseName = "inferior-shell";
    packageName = "inferior-shell";
    description =
      "This CL library allows you to spawn local or remote processes and shell pipes.";

    buildSystems = [ "inferior-shell" ];

    deps = with lispPackages; [
      pkgs.asdf
      alexandria
      fare-mop
      fare-quasiquote-extras
      fare-utils
      trivia
      trivia_dot_quasiquote
    ];

    src = inputs.inferior-shell;

    asdFilesToKeep = [ "inferior-shell.asd" ];
  };

  ip-utils = buildLispPackage {
    baseName = "ip-utils";
    packageName = "ip-utils";
    description = "Simple Common Lisp utility functions for working with IPs";

    buildSystems = [ "ip-utils" ];

    deps = with lispPackages; [ cl-ppcre split-sequence trivia ];

    src = inputs.ip-utils;

    asdFilesToKeep = [ "ip-utils.asd" ];
  };

  osicat = buildLispPackage {
    baseName = "osicat";
    packageName = "osicat";
    description =
      "Osicat is a lightweight operating system interface for Common Lisp on Unix-platforms.";

    buildSystems = [ "osicat" ];

    deps = with lispPackages; [ alexandria cffi-grovel trivial-features ];

    src = inputs.osicat;

    asdFilesToKeep = [ "osicat.asd" ];
  };

  slynk = buildLispPackage {
    baseName = "slynk";
    packageName = "slynk";
    description = "SLY is Sylvester the Cat's Common Lisp IDE for Emacs.";

    buildSystems = [
      "slynk"
      "slynk/arglists"
      "slynk/fancy-inspector"
      "slynk/package-fu"
      "slynk/mrepl"
      "slynk/trace-dialog"
      "slynk/profiler"
      "slynk/stickers"
      "slynk/stickers"
      "slynk/indentation"
      "slynk/retro"
    ];

    deps = [ ];

    src = inputs.slynk;

    asdFilesToKeep = [ "slynk/slynk.asd" ];
  };

  slynk-asdf = buildLispPackage {
    baseName = "slynk-asdf";
    packageName = "slynk-asdf";
    description =
      "SLY-ASDF is a contrib for SLY that adds support for editing ASDF systems, exposing several utilities for working with and loading systems.";

    buildSystems = [ "slynk-asdf" ];

    deps = [ slynk ];

    src = inputs.slynk-asdf;

    asdFilesToKeep = [ "slynk-asdf.asd" ];
  };

  slynk-macrostep = buildLispPackage {
    baseName = "slynk-macrostep";
    packageName = "slynk-macrostep";
    description =
      "sly-macrostep is a SLY contrib for expanding CL macros right inside the source file.";

    buildSystems = [ "slynk-macrostep" ];

    deps = [ slynk ];

    src = inputs.slynk-macrostep;

    asdFilesToKeep = [ "slynk-macrostep.asd" ];
  };

  slynk-stepper = buildLispPackage {
    baseName = "slynk-stepper";
    packageName = "slynk-stepper";
    description = "A portable Common Lisp stepper interface.";

    buildSystems = [ "slynk-stepper" ];

    deps = [ agnostic-lizard slynk ];

    src = inputs.slynk-stepper;

    asdFilesToKeep = [ "slynk-stepper.asd" ];
  };

  usocket-server = buildLispPackage {
    baseName = "usocket-server";
    packageName = "usocket-server";
    description =
      "This is the usocket Common Lisp sockets library: a library to bring sockets access to the broadest of common lisp implementations as possible.";

    buildSystems = [ "usocket" "usocket-server" ];

    deps = with lispPackages; [ bordeaux-threads split-sequence ];

    src = inputs.usocket-server;

    asdFilesToKeep = [ "usocket.asd" "usocket-server.asd" ];
  };

  xml-emitter = buildLispPackage {
    baseName = "xml-emitter";
    packageName = "xml-emitter";
    description = "Map Lisp to XML.";

    buildSystems = [ "xml-emitter" ];

    deps = with lispPackages; [ cl-utilities ];

    src = inputs.xml-emitter;

    asdFilesToKeep = [ "xml-emitter.asd" ];
  };

}
