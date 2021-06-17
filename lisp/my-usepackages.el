;; my-usepackages.el

;; Load package manager and archives
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t) ;; ssl error
(package-initialize)
;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq quelpa-checkout-melpa-p nil) ;; we are using it for counshell only
(use-package quelpa)
(use-package quelpa-use-package)

(provide 'my-usepackages)

