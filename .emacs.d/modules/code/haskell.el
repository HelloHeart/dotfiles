(use-package haskell-mode

  :config
  (defcustom haskell-formatter 'ormolu
    "The Haskell formatter to use. One of: 'ormolu, 'stylish, nil. Set it per-project in .dir-locals."
    :safe 'symbolp)

  (defun haskell-smart-format ()
    "Format a buffer based on the value of 'haskell-formatter'."
    (interactive)
    (cl-ecase haskell-formatter
      ('ormolu (ormolu-format-buffer))
      ('stylish (haskell-mode-stylish-buffer))
      (nil nil)
      ))

  (defun haskell-switch-formatters ()
    "Switch from ormolu to stylish-haskell, or vice versa."
    (interactive)
    (setq haskell-formatter
          (cl-ecase haskell-formatter
            ('ormolu 'stylish)
            ('stylish 'ormolu)
            (nil nil))))

  ;; haskell-mode doesn't know about newer GHC features.
  (let ((new-extensions '("QuantifiedConstraints"
                          "DerivingVia"
                          "BlockArguments"
                          "DerivingStrategies"
                          "StandaloneKindSignatures"
                          )))
    (setq
     haskell-ghc-supported-extensions
     (append haskell-ghc-supported-extensions new-extensions)))

  ;; :bind (("C-c a c" . haskell-cabal-visit-file)
  ;;        ("C-c a i" . haskell-navigate-imports)
  ;;        ("C-c a I" . haskell-navigate-imports-return))
  )

(use-package haskell-snippets
  :after (haskell-mode yasnippet)
  :defer)

(use-package lsp-haskell
  :hook (haskell-mode . lsp)
  :custom
  (lsp-haskell-process-path-hie "ghcide")
  (lsp-haskell-process-args-hie '())
  (lsp-log-io t)
  )

(use-package ormolu)



;;(use-package haskell-mode)


;; (use-package haskell-mode
;;   :custom
;;   (haskell-process-type 'cabal-new-repl)
;;   (haskell-process-suggest-remove-import-lines t)
;;   (haskell-process-auto-import-loaded-modules t)
;;   (haskell-process-log t)
;;   (haskell-tags-on-save t)

;;   (haskell-indentation-layout-offset 4)
;;   (haskell-indentation-starter-offset 4)
;;   (haskell-indentation-left-offset 4)
;;   (haskell-indentation-where-pre-offset 4)
;;   (haskell-indentation-where-post-offset 4)
;;   :config
;;   (defun haskell-mode-setup ()
;;     (interactive-haskell-mode)
;;     (setq tab-width 2)
;;     (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
;;     (define-key evil-normal-state-map (kbd "C-]") 'haskell-mode-goto-loc)
;;     (define-key evil-normal-state-map (kbd "C-c C-]") 'haskell-mode-tag-find)
;;     (define-key evil-normal-state-map (kbd "C-c C-t") 'haskell-mode-show-type-at))
;;   (add-hook 'haskell-mode-hook 'haskell-mode-setup))

;; (use-package flycheck-haskell
;;   :config
;;   (setq-default flycheck-disabled-checkers '(haskell-stack-ghc))
;;   (add-hook 'haskell-mode-hook #'flycheck-haskell-setup))

;; (use-package company-ghci
;;   :after (pos-tip)
;;   :config
;;   (defun show-hoogle-info-in-popup ()
;;     (pos-tip-show (company-ghci/hoogle-info (symbol-at-point)) nil nil nil -1))
;;   (defun company-ghci-setup ()
;;     (define-key evil-normal-state-map (kbd "C-;") (lambda () (interactive) (show-hoogle-info-in-popup))))
;;   (push 'company-ghci company-backends)
;;   (add-hook 'haskell-interactive-mode-hook 'company-mode)
;;   (add-hook 'haskell-mode-hook 'company-ghci-setup))






;; ;; (use-package haskell-mode
;; ;;   ;; :hook (
;; ;;   ;;(haskell-mode . 'turn-on-haskell-indent)
;; ;;   ;;	 )
;; ;; 					;:bind (:map 'interactive-haskell-mode-map
;; ;; 					;  ("C-c ." . 'haskell-mode-goto-loc)
;; ;; 					; ("C-c t" . 'haskell-mode-show-type-at))
;; ;;   :config
;; ;;   (require 'haskell)
;; ;;   (require 'haskell-mode)
;; ;;   (require 'haskell-interactive-mode)
;; ;;   (require 'autoinsert)
;; ;;   (setq haskell-ask-also-kill-buffers nil
;; ;; 	haskell-indentation-layout-offset 4
;; ;; 	haskell-indentation-mode nil
;; ;; 	interactive-haskell-mode 1
;; ;; 	haskell-indentation-left-offset 4
;; ;; 	haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans" "--ghc-option=-fshow-loaded-modules"
;; ;; 						"--ghc-option=-fdefer-type-errors"))
;; ;; 	haskell-process-args-ghci (quote ("-ferror-spans" "-fshow-loaded-modules" "-fdefer-type-errors"))
;; ;; 	haskell-indent-mode nil
;; ;; 	))


;; ;; ;; get to work later: auto enable haskell-indentation-mode
