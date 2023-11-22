#!/bin/bash

set -e -x

rm -rf straight/repos
git clean -xfd
./test-startup.sh
