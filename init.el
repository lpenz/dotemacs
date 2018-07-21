(setq gc-cons-threshold 100000000)
(run-with-idle-timer
 5 nil
 (lambda ()
   (setq gc-cons-threshold 1000000)))

(let ((file-name-handler-alist nil))

  ;; (package-initialize) ; done in use-package initialization

  ;; Load files with individual packages and corresponding configs:
  (load "~/.emacs.d/my-usepackages.el")
  (load "~/.emacs.d/my-theme.el")
  (load "~/.emacs.d/my-general.el")
  (load "~/.emacs.d/my-evil.el")
  (use-package magit)
  (use-package evil-magit)
  (use-package git-gutter :config (global-git-gutter-mode +1))
  (use-package fill-column-indicator)
  (use-package yasnippet :config (yas-global-mode 1))
  (use-package realgud)
  (load "~/.emacs.d/my-whichkey.el")
  (load "~/.emacs.d/my-ivy.el")
  (load "~/.emacs.d/my-autosave.el")
  (load "~/.emacs.d/my-flycheck.el")
  (load "~/.emacs.d/my-ggtags.el")
  (load "~/.emacs.d/my-winum.el")
  (load "~/.emacs.d/my-compilation.el")
  (load "~/.emacs.d/my-counshell.el")
  (use-package flycheck-mypy)
  (use-package package-lint)

  ;; Languages
  (use-package rust-mode)
  (use-package haskell-mode)
  (use-package yaml-mode)
  (use-package markdown-mode)
  (use-package graphviz-dot-mode)
  (use-package py-yapf)
  (use-package go-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (use-package dockerfile-mode)
  (use-package clojure-mode)
  (use-package clang-format)
  (add-to-list 'auto-mode-alist '("\\.m" . octave-mode))
  (add-to-list 'auto-mode-alist '("SConstruct" . python-mode))
  (add-to-list 'auto-mode-alist '("SConscript" . python-mode))

  ;; Settings: ;;;;;;

  (setq-default indent-tabs-mode nil) ;; Indent with spaces
  (setq inhibit-startup-message t) ;; No startup message
  (setq scroll-step 1) ;; smooth scrolling
  (setq visible-bell nil) ;; Avoid screen flicker due to visual bell
  (setq c-basic-offset 4)
  (setq ediff-split-window-function 'split-window-horizontally)

  ;; my-afterinit.el overrides whatever a rogue package may have done
  (add-hook 'after-init-hook '(lambda () (load "~/.emacs.d/my-afterinit.el")))

  ;; Local configurations
  (if (file-exists-p "~/.emacs-local.el")
      (load "~/.emacs-local.el"))

  ;; Customizations go to another file, not to this one
  (setq custom-file "~/.emacs-custom.el")
  (write-region "" nil custom-file)
  (load custom-file)

  (kill-buffer "*scratch*")
  )
