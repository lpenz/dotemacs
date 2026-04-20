;;; my-dev-cpp.el --- My dev-cpp configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My dev-cpp configuration.

;;; Code:

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
;;; my-dev-cpp.el ends here
