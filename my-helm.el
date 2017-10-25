; my-helm.el

(use-package helm-core :defer t)
(use-package helm
  :bind (("M-x" . helm-M-x)
	 :map helm-map
	      ("C-j" . helm-next-line)
	      ("C-k" . helm-previous-line))
  :config (progn
	    (setq helm-M-x-fuzzy-match t
	          helm-mode-fuzzy-match t
		  helm-buffers-fuzzy-matching t
		  helm-apropos-fuzzy-match t
	          helm-completion-in-region-fuzzy-match t)
	    (helm-mode 1)))
