;; my-formats-misc.el -*- lexical-binding: t; -*-

(use-package reformatter)

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
  :after reformatter
  :mode "\\.fish\\'"
  :config
  (reformatter-define fish-format
    :program "fish_indent"
    :args '())
  (add-hook 'fish-mode-hook #'fish-format-on-save-mode)
  )

(use-package nixpkgs-fmt
  :hook (nix-mode . nixpkgs-fmt-on-save-mode))

(use-package rpm-spec-mode
  :mode "\\.spec\\'")

(use-package plantuml-mode
  :mode "\\.plantuml\\'")
(use-package flycheck-plantuml
  :mode "\\.plantuml\\'")

(use-package yaml
  :mode ("\\.ya?ml\\'" . yaml-ts-mode)
  :hook (yaml-ts-mode . (lambda()
                          (setq-local apheleia-formatter '(yamlfmt))
                          (apheleia-mode 1)
                          (my-treesit-setup-lang
                           'yaml
                           #'yaml-ts-mode
                           "https://github.com/tree-sitter-grammars/tree-sitter-yaml"))))

(use-package dts-mode
  :mode "\\.keymap\\'")

;; (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
;; (add-to-list 'auto-mode-alist '("valgrind.*\\.supp$" . conf-mode))

(provide 'my-formats-misc)
