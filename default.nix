{ lib, clangStdenv, fetchFromGitHub, cmake, llvmPackages, clang, python3, pkg-config, libxml2, sqlite, ninja, libuuid, lzma, xar, ... }:

clangStdenv.mkDerivation rec {
  pname = "mull";
  version = "0.11.2";

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
    xar
  ];

  cmakeFlags = [
    "-DMULL_VERSION=${version}"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DPATH_TO_LLVM=${llvmPackages.libllvm.out.dev}"
    "-DClang_DIR=${llvmPackages.libclang.out.dev}/lib/cmake/clang"
    "-DCMAKE_THREAD_PREFER_PTHREAD=True"
    "-DTHREADS_PREFER_PTHREAD_FLAG=True"
    "-DLIBXML2_INCLUDE_DIRS:PATH=${libxml2.out.dev}/include"
    "-DLIBXML2_LIBRARY:PATH=${libxml2.out}/lib"
  ];

  LIBXML2_INCLUDE_DIRS="${libxml2.out.dev}/include";

  # upstream_src = fetchFromGitHub {
  #   owner = "mull-project";
  #   repo = "mull";
  #   rev = version;
  #   sha256 = "0bzf1zczwzlc3g6rn19lf6jj09lphdkbwd3vq7kc43q6wdnki5n8";
  #   fetchSubmodules = true;
  # };

  # my_src = fetchFromGitHub {
  #   owner = "mayl";
  #   repo = "mull";
  #   rev = "HEAD";
  #   sha256 = lib.fakeSha256;
  #   fetchSubmodules = true;
  # };

  src = ../mull_lpm; 

}
