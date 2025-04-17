#!/bin/bash

set -e -x

emacs --batch \
    -l ~/.emacs.d/init.el \
    --eval "(progn
              (require 'straight)
              (straight-thaw-versions)
              (straight-rebuild-all)
              (straight-normalize-all))"
./test-startup.sh
