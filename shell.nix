{ pkgs ? import <nixos-unstable>{}, ...}:
with pkgs;
let
  mull = import ./default.nix;
in
mkShell {
  PATH_TO_LLVM = llvm.out;
  buildInputs = [
    (callPackage mull{})
    # (callPackage (import ./libebc.nix){})
  ];
}
