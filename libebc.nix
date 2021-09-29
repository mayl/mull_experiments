{ lib, clangStdenv, fetchFromGitHub, cmake, llvmPackages, clang, python3, pkg-config, libxml2, sqlite, ninja, libuuid, lzma, ... }:

clangStdenv.mkDerivation rec {
  pname = "mull";
  version = "1.2";

  nativeBuildInputs = [
    clang
    cmake
    libxml2
    llvmPackages.libclang.dev
    llvmPackages.libllvm.dev
    pkg-config
    python3
    sqlite
    ninja
    libuuid
    lzma
  ];

  cmakeFlags = [
    "-DLIB_XML2_INCLUDE_DIR:PATH=${libxml2.out.dev}/include"
    "-DLIBXML2_LIBRARY:PATH=${libxml2.out}/lib"
  ];

  src = fetchFromGitHub {
    owner = "Guardsquare";
    repo = "LibEBC";
    rev = version;
    sha256 = "16413a1mgppap3x7sfz7lsrr5s1jgglxdbh09pw211fghcjg3q3m";
  };
}
