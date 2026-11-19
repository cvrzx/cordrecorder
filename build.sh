#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
SDK=$(xcrun --sdk iphoneos --show-sdk-path)
xcrun --sdk iphoneos clang -arch arm64 -isysroot "$SDK" -miphoneos-version-min=16.0 -fobjc-arc -fblocks -O2 -dynamiclib CordRecorder.m -framework Foundation -framework UIKit -framework ReplayKit -framework AVKit -framework AVFoundation -framework CoreMedia -framework CoreGraphics -framework Photos -framework QuartzCore -Wl,-install_name,@rpath/CordRecorder.dylib -o CordRecorder.dylib
xcrun lipo -verify_arch arm64 CordRecorder.dylib
file CordRecorder.dylib
