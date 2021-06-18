;; my-usepackages.el

;; Load package manager and archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t) ;; ssl error
(package-initialize)
(when (not package-archive-contents) (package-refresh-contents))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Bootstrap quelpa
(use-package quelpa
  :config
  (setq quelpa-checkout-melpa-p nil) ;; we are using it for counshell only
  )
(use-package quelpa-use-package
  :after quelpa
  :config
  (quelpa-use-package-activate-advice)
  )

(provide 'my-usepackages)

