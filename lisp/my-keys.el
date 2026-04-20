;;; my-keys.el --- My keys configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; My keys configuration.

;;; Code:

(use-package emacs
  :general
  ("SPC h h"  'highlight-symbol-at-point)
  ("SPC h ."  'highlight-symbol-at-point)
  ("SPC h r"  'highlight-regexp)
  ("SPC h c"  'unhighlight-regexp))

(provide 'my-keys)
;;; my-keys.el ends here
