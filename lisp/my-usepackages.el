;; my-usepackages.el

;; Load package manager and archives

;; Bootstrap use-package
(straight-use-package 'use-package)
;; (require 'use-package)
(use-package el-patch
    :straight t)
(setq straight-use-package-by-default t)

(provide 'my-usepackages)

