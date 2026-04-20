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
                     (with-current-buffer (get-buffer-create "*relint*")
                       (erase-buffer)
                       (relint-file file)
                       (when (> (buffer-size) 0)
                         (error "Relint failed for %s:\n%s" file (buffer-string)))))

                   ;; 3. Checkdoc check
                   (dolist (file files)
                     (message "Checking documentation in %s..." file)
                     (with-current-buffer (find-file-noselect file)
                       (let ((diag-buffer "*Checkdoc-Log*"))
                         (if (get-buffer diag-buffer)
                             (kill-buffer diag-buffer))
                         (setq checkdoc-diagnostic-buffer diag-buffer)
                         (setq checkdoc-force-docstrings-flag nil)
                         (checkdoc-current-buffer t)
                         (when (and (get-buffer diag-buffer)
                                  (with-current-buffer diag-buffer
                                    (goto-char (point-min))
                                    (re-search-forward ":[0-9]+: " nil t)))

                           (error "Checkdoc failed for %s:\n%s" file
                                  (with-current-buffer diag-buffer
                                    (buffer-string))))))))))'
