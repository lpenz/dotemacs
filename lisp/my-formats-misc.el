;; my-formats-misc.el -*- lexical-binding: t; -*-

(use-package clojure-mode)
(use-package lua-mode)
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
(use-package shfmt
  :config
  (add-hook 'sh-mode-hook 'shfmt-on-save-mode)
  (setq shfmt-arguments '("-i" "4")))
(use-package plantuml-mode)
(use-package flycheck-plantuml)
(use-package yaml-mode)
(use-package python-black)
(use-package python-isort)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))
(add-to-list 'auto-mode-alist '("valgrind.*\\.supp$" . conf-mode))

(provide 'my-formats-misc)
