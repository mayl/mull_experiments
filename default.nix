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

  postInstall = ''
    ln -sn $out/bin/mull-cxx-* $out/bin/mull-cxx
    ln -sn $out/bin/mull-runner-* $out/bin/mull-runner
  '';

  cmakeFlags = [
    # "-DMULL_VERSION=${version}"
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCMAKE_SKIP_BUILD_RPATH=ON"
    "-DClang_DIR=${llvmPackages.libclang.out.dev}/lib/cmake/clang"
    "-DTHREADS_PREFER_PTHREAD_FLAG=True"
  ];

  upstream_src = fetchFromGitHub {
    owner = "mull-project";
    repo = "mull";
    rev = "HEAD";
    sha256 = "njz7wtmYXJlpPCbzSXJc8NT1AHM9E7m98z6X4wh5tes=";
    fetchSubmodules = true;
  };

  # my_src = fetchFromGitHub {
  #   owner = "mayl";
  #   repo = "mull";
  #   rev = "HEAD";
  #   sha256 = "1y6chvk63v4bfvklg1ry0hkayz0vfmdhwcsshqg8chdv9sabgblz";
  #   fetchSubmodules = true;
  # };

  src = upstream_src;
}
