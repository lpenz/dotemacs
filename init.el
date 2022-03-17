;; Based on https://github.com/purcell/emacs.d

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq gc-cons-threshold 100000000)
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)))

(let ((file-name-handler-alist nil))

  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

  ;; (package-initialize) ; done in use-package initialization

  ;; Load files with individual packages and corresponding configs:
  (require 'my-straight)
  (require 'my-usepackages)
  (use-package undo-tree :init (global-undo-tree-mode))
  (require 'my-theme)
  (require 'my-general)
  (require 'my-evil)
  (require 'my-magit)
  (use-package git-gutter :config (global-git-gutter-mode +1))
  (use-package fill-column-indicator)
  (use-package yasnippet :config (yas-global-mode 1))
  ;; (use-package realgud)
  (require 'my-whichkey)
  (require 'my-ivy)
  (require 'my-avy)
  (require 'my-autosave)
  (require 'my-flycheck)
  (require 'my-ggtags)
  (require 'my-winum)
  (require 'my-compilation)
  (require 'my-counshell)
  (require 'my-eshell)
  (use-package flycheck-mypy)
  (use-package package-lint)
  (require 'my-company)
  (use-package dumb-jump)

  ;; Languages
  (require 'my-lang-cpp)
  (use-package clojure-mode)
  (use-package cmake-mode)
  (use-package dockerfile-mode)
  (use-package go-mode)
  (use-package graphviz-dot-mode
    :config
    (setq graphviz-dot-indent-width 4))
  (use-package haskell-mode)
  (use-package ninja-mode)
  (use-package jinja2-mode)
  (use-package markdown-mode)
  (use-package nix-mode)
  (use-package nixpkgs-fmt)
  (use-package py-yapf)
  (use-package rjsx-mode)
  (use-package rust-mode
    :config
    (setq rust-match-angle-brackets nil)
    (setq rust-format-on-save t))
  (use-package plantuml-mode)
  (use-package flycheck-plantuml)
  (use-package yaml-mode)
  (use-package python-black)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
  (add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
  (add-to-list 'auto-mode-alist '("SConscript" . python-mode))
  (add-to-list 'auto-mode-alist '("valgrind.*\\.supp$" . conf-mode))

  ;; Settings: ;;;;;;

  (setq-default indent-tabs-mode nil) ;; Indent with spaces
  (setq inhibit-startup-message t) ;; No startup message
  (setq scroll-step 1) ;; smooth scrolling
  (setq visible-bell nil) ;; Avoid screen flicker due to visual bell
  (setq c-basic-offset 4)
  (setq ediff-split-window-function 'split-window-horizontally)
  (require 'my-keys)

  ;; my-afterinit.el overrides whatever a rogue package may have done
  (add-hook 'after-init-hook '(lambda () (require 'my-afterinit)))

  ;; Local configurations
  (if (file-exists-p "~/.emacs-local.el")
      (load "~/.emacs-local.el"))

  ;; Customizations go to another file, not to this one
  (setq custom-file "~/.emacs-custom.el")
  (write-region "" nil custom-file)
  (load custom-file)

  (kill-buffer "*scratch*")
  )
