
;; (package-initialize) ; done in use-package initialization

;; Load files with individual packages and corresponding configs:
(load "~/.emacs.d/my-usepackages.el")
(load "~/.emacs.d/my-theme.el")
(load "~/.emacs.d/my-general.el")
(load "~/.emacs.d/my-evil.el")
(use-package magit)
(use-package evil-magit)
(use-package fill-column-indicator)
(load "~/.emacs.d/my-ivy.el")
(load "~/.emacs.d/my-autosave.el")
(load "~/.emacs.d/my-projectile.el")
(load "~/.emacs.d/my-flycheck.el")
(load "~/.emacs.d/my-winum.el")

;; Languages
(use-package rust-mode)
(use-package yaml-mode)
(use-package markdown-mode)

;; Settings: ;;;;;;

;; Avoid screen flicker due to visual bell
(setq visible-bell nil)

;; my-afterinit.el overrides whatever a rogue package may have done
(add-hook 'after-init-hook '(lambda () (load "~/.emacs.d/my-afterinit.el")))

;; Local configurations
(if (file-exists-p "~/.emacs-local.el")
    (load "~/.emacs-local.el"))

;; Customizations go to another file, not to this one
(setq custom-file "~/.emacs-custom.el")
(write-region "" nil custom-file)
(load custom-file)
