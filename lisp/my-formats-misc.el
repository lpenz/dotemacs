;; my-formats-misc.el -*- lexical-binding: t; -*-

(use-package lua-mode
  :mode "\\.lua\\'")

(use-package cmake-mode
  :mode "\\CMakeLists.txt\\'")

(use-package dockerfile-mode
  :mode "\\Dockerfile\\'")

(use-package go-mode
  :mode "\\.go\\'"
  :hook (before-save . gofmt-before-save))

(use-package graphviz-dot-mode
  :mode "\\.dot\\'"
  :custom
  (graphviz-dot-indent-width 4))

(use-package haskell-mode
  :mode "\\.hs\\'")

(use-package ninja-mode
  :mode "\\.nj\\'")

(use-package jinja2-mode
  :mode "\\.j2\\'")

(use-package markdown-mode
  :mode "\\.md\\'")

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package fish-mode
  :mode "\\.fish\\'")

(use-package nixpkgs-fmt
  :hook (nix-mode . nixpkgs-fmt-on-save-mode))

(use-package rust-mode
  :mode "\\.rs\\'"
  :custom
  (rust-match-angle-brackets t)
  (rust-format-on-save t))

(use-package shfmt
  :hook (sh-mode . shfmt-on-save-mode)
  :custom
  (shfmt-arguments '("-i" "4")))

(use-package plantuml-mode
  :mode "\\.plantuml\\'")
(use-package flycheck-plantuml
  :mode "\\.plantuml\\'")

(use-package yaml-mode
  :mode "\\.yaml\\'"
  :mode "\\.yml\\'")

(use-package dts-mode
  :mode "\\.keymap\\'")

;; (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;; (add-to-list 'auto-mode-alist '("valgrind.*\\.supp$" . conf-mode))

(provide 'my-formats-misc)
