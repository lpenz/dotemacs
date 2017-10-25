; ~/.emacs.d/my-packages.el

; Load package manager and archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

; Install packages

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package evil
    :config
    (evil-mode 1)
    (define-key evil-insert-state-map (kbd "<f2>") 'save-buffer)
    (define-key evil-normal-state-map (kbd "<f2>") 'save-buffer)
    (define-key evil-normal-state-map (kbd "SPC TAB") 'evil-buffer)
    (define-key evil-normal-state-map (kbd "SPC f f") 'helm-find-files)
    (define-key evil-normal-state-map (kbd "SPC b b") 'helm-buffers-list)
    )

(use-package magit)
