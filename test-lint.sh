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
                 (run-hooks (quote after-init-hook))
                 (let ((byte-compile-error-on-warn t)
                       (files (directory-files "lisp" t "\\.el$")))
                   ;; 1. Byte-compile check
                   (dolist (file files)
                     (message "Byte-compiling %s..." file)
                     (byte-compile-file file))

                   ;; 2. Relint check
                   (straight-use-package (quote relint))
                   (require (quote relint))
                   (dolist (file files)
                     (message "Relinting %s..." file)
                     (relint-file file))

                   ;; 3. Checkdoc check
                   (dolist (file files)
                     (message "Checking documentation in %s..." file)
                     (checkdoc-file file)))))'
