;; my-ggtags.el

(use-package ggtags
  :commands ggtags-mode
  :diminish ggtags-mode
  :config
  (general-define-key
   :keymaps 'ggtags-mode-map
   :states '(normal)
   "SPC g g" 'helm-gtags-dwim))
