#!/usr/bin/env bash
# Place this file next to src/ folder

cmake -S src/ -B build/     # Request that outputs from the build be placed in the build/ folder
cmake --build build/        # Start the build
./build/hello               # Run the compiled program.  Outputs "Hello, world!"
