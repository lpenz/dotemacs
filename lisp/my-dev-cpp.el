;; my-dev-cpp.el -*- lexical-binding: t; -*-

(use-package clang-format
  :commands (clang-format
             clang-format-buffer
             clang-format-region))

(use-package clang-format+
  :straight (clang-format+
             :type git
             :host github
             :repo "SavchenkoValeriy/emacs-clang-format-plus")
  :commands clang-format+-mode)

(provide 'my-dev-cpp)

