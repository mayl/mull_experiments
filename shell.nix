{ pkgs ? import <nixos-unstable>{}, ...}:
with pkgs;
let
  mull = import ./default.nix;
in
mkShell {
  PATH_TO_LLVM = llvm.out;
  buildInputs = [
    clang
    meson
    ninja
    (callPackage mull{})
    # (callPackage mull{llvmPackages = llvmPackages_9;})
    # (callPackage (import ./libebc.nix){})
  ];
}
