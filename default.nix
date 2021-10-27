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

  prePatch = ''
    substituteInPlace CMakeLists.txt \
      --replace 'SET(CMAKE_SKIP_BUILD_RPATH FALSE)' 'SET(CMAKE_SKIP_BUILD_RPATH TRUE)'
  '';

  cmakeFlags = [
    "-DMULL_VERSION=${version}"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_SKIP_BUILD_RPATH=ON"
    "-DPATH_TO_LLVM=${llvmPackages.libllvm.out.dev}"
    "-DClang_DIR=${llvmPackages.libclang.out.dev}/lib/cmake/clang"
    "-DTHREADS_PREFER_PTHREAD_FLAG=True"
    "-DLIBXML2_INCLUDE_DIRS:PATH=${libxml2.out.dev}/include"
    "-DLIBXML2_LIBRARY:PATH=${libxml2.out}/lib"
  ];

  # upstream_src = fetchFromGitHub {
  #   owner = "mull-project";
  #   repo = "mull";
  #   rev = version;
  #   sha256 = "0bzf1zczwzlc3g6rn19lf6jj09lphdkbwd3vq7kc43q6wdnki5n8";
  #   fetchSubmodules = true;
  # };

  my_src = fetchFromGitHub {
    owner = "mayl";
    repo = "mull";
    rev = "HEAD";
    sha256 = "1y6chvk63v4bfvklg1ry0hkayz0vfmdhwcsshqg8chdv9sabgblz";
    fetchSubmodules = true;
  };

  src = my_src;

  #src = ../mull_lpm; 

}
