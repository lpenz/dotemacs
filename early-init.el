;; early-init.el -*- lexical-binding: t; -*-

(setq-default native-comp-speed 2
              native-comp-async-report-warnings-errors nil
              native-comp-async-query-on-exit t
              native-comp-jit-compilation-deny-list '("\\(?:[/\\\\]\\.dir-locals\\.el$\\)"))
(setq load-prefer-newer t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)
(setq visible-bell nil)
(setq-default inhibit-startup-screen t
              inhibit-startup-message t
              inhibit-splash-screen t
              initial-scratch-message nil
              inhibit-startup-buffer-menu t
              inhibit-startup-echo-area-message user-login-name)
(setq initial-major-mode 'fundamental-mode)
(setq package-enable-at-startup nil) ;; ensure package doesn't interfere
;; some things that are useful for lsp-mode and also during startup
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

(provide 'early-init)
