{ pkgs ? import <nixos-unstable>{}, ...}:
with pkgs;
let
  mull = import ./default.nix;
in
mkShell {
  PATH_TO_LLVM = llvm.out;
  buildInputs = [
    clang_12
    meson
    ninja
    # (callPackage mull{})
    (callPackage mull{clang = clang_12; llvmPackages = llvmPackages_12;})
    # (callPackage (import ./libebc.nix){})
  ];
}
