;; ~/.emacs.d/my-lang-cpp.el

(use-package clang-format
  :config
  (progn
    (defun clang-format-buffer-smart ()
      "Reformat buffer if .clang-format exists in the projectile root."
      (when (file-exists-p (expand-file-name ".clang-format" (projectile-project-root)))
        (clang-format-buffer)))
    (defun clang-install-hook ()
      (add-hook 'before-save-hook 'clang-format-buffer-smart nil t))
    (add-hook 'c-mode-common-hook 'clang-install-hook)))

(use-package flycheck-clang-tidy
  :after flycheck
  :hook
  (flycheck-mode . flycheck-clang-tidy-setup))

(setq safe-local-variable-values (quote ((flycheck-gcc-language-standard . "c++17"))))
(setq safe-local-variable-values (quote ((flycheck-clang-language-standard . "c++17"))))

(provide 'my-lang-cpp)

