;; my-keys.el -*- lexical-binding: t; -*-

(general-define-key "SPC h h"  'highlight-symbol-at-point)
(general-define-key "SPC h ."  'highlight-symbol-at-point)
(general-define-key "SPC h r"  'highlight-regexp)
(general-define-key "SPC h c"  'unhighlight-regexp)

(general-define-key "SPC a"  'ff-find-other-file)

(provide 'my-keys)

