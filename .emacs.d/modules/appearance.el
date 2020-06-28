(use-package minions
  :init (minions-mode))
(use-package rainbow-mode
  :init (rainbow-mode))
;; (use-package doom-themes
;;   :init
;;   (progn
;;     (setq doom-dracula-comment-bg t
;; 	  doom-dracula-brighter-comments t
;; 	  doom-sourcerer-brighter-comments t
;; 	  doom-sourcerer-comment-bg t
;; 	  doom-sourcerer-brighter-modeline t)
;;     (load-theme 'doom-dracula t)))
;;(use-package darktooth-theme)
(use-package zenburn-theme)
(use-package golden-ratio
  :init (golden-ratio-mode t)
  :config (setq golden-ratio-auto-scale t)
  (add-to-list 'golden-ratio-extra-commands 'ace-window)
  (add-to-list 'golden-ratio-extra-commands 'ace-swap-window))
;; (use-package nyan-mode
;;   :init (nyan-mode)
;;   ;; uses way too much cpu
;;   ;; (nyan-start-animation)
;;   :config (setq nyan-animate-nyancat t
;; 		nyan-wavy-trail t))
