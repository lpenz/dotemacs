;;; my-afterinit.el --- My afterinit configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My afterinit configuration.

;;; Code:

;; My after-init configuration.


;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(provide 'my-afterinit)
;;; my-afterinit.el ends here
