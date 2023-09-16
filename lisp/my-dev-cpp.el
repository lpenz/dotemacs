;; my-dev-cpp.el -*- lexical-binding: t; -*-

(use-package clang-format)

(straight-use-package
 '(clang-format+ :type git :host github :repo "SavchenkoValeriy/emacs-clang-format-plus"))

;; (use-package flycheck-clang-tidy
;;   :after flycheck
;;   :hook
;;   (flycheck-mode . flycheck-clang-tidy-setup))

(setq safe-local-variable-values (quote ((flycheck-gcc-language-standard . "c++17"))))
(setq safe-local-variable-values (quote ((flycheck-clang-language-standard . "c++17"))))

(provide 'my-dev-cpp)

