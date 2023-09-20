;; my-keys.el -*- lexical-binding: t; -*-

(use-package emacs
  :general
  ("SPC h h"  'highlight-symbol-at-point)
  ("SPC h ."  'highlight-symbol-at-point)
  ("SPC h r"  'highlight-regexp)
  ("SPC h c"  'unhighlight-regexp))

(provide 'my-keys)

