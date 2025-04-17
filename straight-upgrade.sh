#!/bin/bash

set -e -x

emacs --batch \
    -l ~/.emacs.d/init.el \
    --eval "(progn
              (require 'straight)
              (straight-pull-all)
              (straight-rebuild-all)
              (straight-freeze-versions)
              (straight-normalize-all))"
./test-startup.sh
