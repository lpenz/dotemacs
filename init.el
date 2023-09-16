;; init.el -*- lexical-binding: t; -*-

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
(setq-default gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(let ((file-name-handler-alist nil))
  (dolist (mod '(my-basics
                 my-pkgmgmt
                 my-theme
                 my-evil
                 my-git
                 my-whichkey
                 my-vertico
                 my-keys
                 my-eshell
                 my-compilation
                 my-projectile
                 my-flycheck
                 ;; my-counshell
                 my-dev-cpp
                 my-lsp
                 my-formats-misc
                 my-misc
                 ))
        (require mod)))

(kill-buffer "*scratch*")
