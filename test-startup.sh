#!/bin/bash

set -e -x

emacs --batch \
    --eval '(progn
              (defvar url-show-status)
              (let
                 ((debug-on-error t)
                  (url-show-status nil)
                  (user-emacs-directory default-directory)
                  (user-init-file (expand-file-name "init.el"))
                  (load-path (delq default-directory load-path)))
                 (load-file user-init-file)
                 (run-hooks (quote after-init-hook))))'
