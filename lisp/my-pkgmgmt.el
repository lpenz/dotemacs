;;; my-pkgmgmt.el -*- lexical-binding: t; -*-

(defvar bootstrap-version)

(setq-default straight-repository-branch "develop")

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(declare-function straight-use-package "ext:straight.el")

;; install use-package
(straight-use-package 'use-package)

(declare-function use-package "ext:use-package-core.el")

(use-package straight
  :custom
  (straight-use-package-by-default t))

(use-package use-package
  :custom
  (setq-default use-package-always-defer t))

(provide 'my-pkgmgmt)
