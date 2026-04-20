;;; my-treesitter.el --- My treesitter configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My treesitter configuration.

;;; Code:

(require 'treesit)

;; (setq treesit-language-source-alist
;;       '((clojure . ("https://github.com/sogaiu/tree-sitter-clojure"))
;;         (elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
;;         (html . ("https://github.com/tree-sitter/tree-sitter-html"))
;;         (javascript . (("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")))
;;         (json . ("https://github.com/tree-sitter/tree-sitter-json"))
;;         (haskell . ("https://github.com/tree-sitter/haskell-tree-sitter"))
;;         (markdown . ("https://github.com/ikatyang/tree-sitter-markdown"))
;;         (python . ("https://github.com/tree-sitter/tree-sitter-python"))
;;         (java . ("https://github.com/serenadeai/java-tree-sitterl"))
;;         (elixir . ("https://github.com/elixir-lang/tree-sitter-elixir"))
;;         (heex . ("https://github.com/phoenixframework/tree-sitter-heex"))
;;         (docker . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
;;         (bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
;;         (c . ("https://github.com/tree-sitter/tree-sitter-c"))
;;         (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
;;         (common-lisp . ("https://github.com/theHamsta/tree-sitter-commonlisp"))
;;         (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
;;         (css . ("https://github.com/tree-sitter/tree-sitter-css"))
;;         (csharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp"))
;;         (go . ("https://github.com/tree-sitter/tree-sitter-go"))
;;         (go-mod . ("https://github.com/camdencheek/tree-sitter-go-mod"))
;;         (html . ("https://github.com/tree-sitter/tree-sitter-html"))
;;         (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
;;         (make . ("https://github.com/alemuller/tree-sitter-make"))
;;         (markdown . ("https://github.com/ikatyang/tree-sitter-markdown"))
;;         (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
;;         (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
;;         (tsx . (("https://github.com/tree-sitter/tree-sitter-typescript") ("master") ("tsx/src")))
;;         (typescript . (("https://github.com/tree-sitter/tree-sitter-typescript") ("master") ("typescript/src")))))

;; Remap modes for built-in supported languages
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)
        (sh-mode . bash-ts-mode)
        (json-mode . json-ts-mode)
        ))

;; Improve the quality of tree-sitter font-locking (highlighting)
;; The default is 3. Level 4 provides the most detailed highlighting.
(setq treesit-font-lock-level 4)

(defun my-treesit-setup-lang (lang mode url)
  "Ensure tree-sitter grammar for LANG is installed from URL, then run MODE.

LANG is a symbol like python.
MODE is the mode function to run.
URL is the git repository for the tree-sitter grammar."
  (unless (treesit-language-available-p lang)
    (unless (assoc lang treesit-language-source-alist)
      (add-to-list 'treesit-language-source-alist (list lang url)))
    (treesit-install-language-grammar lang)
    (message "Tree-sitter grammar for %s installed." lang)
    ;; Re-run the mode after installing grammar
    (funcall mode)))

(provide 'my-treesitter)
;;; my-treesitter.el ends here
