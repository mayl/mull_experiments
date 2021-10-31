#! /usr/bin/env bash
set -eou pipefail

pushd $(pwd)
cd "$(dirname "$0")"
clang -fembed-bitcode -g helloworld.cpp -o hello-world
mull-cxx-7 -ide-reporter-show-killed hello-world
rm hello-world
popd
