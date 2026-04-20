;;; my-whichkey.el --- My whichkey configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My whichkey configuration.

;;; Code:

(use-package which-key
  :demand t
  :after evil
  :config
  (which-key-mode)
  :custom
  (which-key-idle-delay 0.7))

(provide 'my-whichkey)
;;; my-whichkey.el ends here
