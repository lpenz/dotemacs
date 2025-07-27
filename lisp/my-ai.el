;; my-ai.el -*- lexical-binding: t; -*-

(require 'auth-source)

(defun my-auth-get-secret (host)
  "Return the secret (e.g. password or API key) for HOST from authinfo."
  (let ((entry (car (auth-source-search
                     :host host
                     :user "apikey"
                     :require '(:secret)))))
    (when entry
      (let ((secret (plist-get entry :secret)))
        (if (functionp secret)
            (funcall secret)
          secret)))))

(use-package gptel
  :general
  ("SPC i j" 'gptel)
  ("SPC i m" 'gptel-menu)
  :init
  (defvar gptel-backend)
  (defvar gptel-model)
  :config
  (setq gptel-backend (gptel-make-openai
                       "OpenRouter"
                       :host "openrouter.ai"
                       :endpoint "/api/v1/chat/completions"
                       :stream t
                       :key 'gptel-api-key-from-auth-source
                       :models '(
                                 google/gemini-2.0-flash-exp:free
                                 mistralai/mistral-7b-instruct:free
                                 )
                       )
        gptel-model 'mistralai/mistral-7b-instruct:free))

(use-package aidermacs
  :general
  ("SPC i i" 'aidermacs-transient-menu)
  :init
  (setq aidermacs-api-base "https://openrouter.ai/api/v1"
        aidermacs-api-key (my-auth-get-secret "openrouter.ai")
        aidermacs-model "mistralai/mixtral-8x7b"
        ))

(use-package emigo
  :straight (:host github :repo "MatthewZMD/emigo" :files (:defaults "*.py" "*.el"))
  :general
  ("SPC i m" 'emigo)
  :custom
  ;; Encourage using OpenRouter with Deepseek
  ;; (emigo-model "openrouter/deepseek/deepseek-chat-v3-0324") ;; credit exc
  ;; (emigo-model "openrouter/deepseek/deepseek-r1:free") ;; no tool use
  (emigo-model "openrouter/google/gemini-2.0-flash-exp:free")
  (emigo-base-url "https://openrouter.ai/api/v1")
  (emigo-api-key (my-auth-get-secret "openrouter.ai")))

(provide 'my-ai)
