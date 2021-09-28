{ pkgs ? import <nixpkgs>{}, ...}:
with pkgs;
let
  mull = import ./default.nix;
in
mkShell {
  PATH_TO_LLVM = llvm.out;
  buildInputs = [
    (callPackage mull{})
  ];
}
