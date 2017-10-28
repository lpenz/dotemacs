
;; (package-initialize) ; done in use-package initialization

;; Load files with individual packages and corresponding configs:
(load "~/.emacs.d/my-usepackages.el")
(load "~/.emacs.d/my-theme.el")
(load "~/.emacs.d/my-evil.el")
(use-package magit)
(load "~/.emacs.d/my-autosave.el")

;; my-afterinit.el overrides whatever a rogue package may have done
(add-hook 'after-init-hook '(lambda () (load "~/.emacs.d/my-afterinit.el")))

;; customizations go to another file, not to this one
(setq custom-file "~/.emacs-custom.el")
(write-region "" nil custom-file)
(load custom-file)
