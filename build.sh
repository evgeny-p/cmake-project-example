#!/bin/bash

cmake -Bdebug -DCMAKE_BUILD_TYPE=Debug
cmake --build debug
cmake --build debug --target test

#cmake -Brelease -DCMAKE_BUILD_TYPE=Release
#cmake --build release
#cmake --build release --target test
