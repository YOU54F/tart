#!/bin/sh

# helper script to build and run a signed tart binary
# usage: ./scripts/run-signed.sh run ventura-base

set -e

swift build --product tart --configuration release
codesign --sign - --entitlements Resources/tart-prod.entitlements --force .build/release/tart

.build/release/tart "$@"
