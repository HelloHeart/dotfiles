(use-package magit)
(use-package eldoc)
(use-package yasnippet)
(use-package company
  :bind (("C-<tab>" . 'company-complete-common-or-cycle))
  :hook ((prog-mode . company-mode)
   ;;(slime-mode . (lambda () (company-mode -1)))
      (cider-repl-mode . company-mode)
   (company-mode . yas-minor-mode)))


(use-package company-box
   :hook (company-mode . company-box-mode))

;; (use-package company-quickhelp
;;  :hook (company-mode . company-quickhelp-local-mode))

(use-package company-lsp
  :config
  (push 'company-lsp company-backends))

;; (use-package lispy
;;   :hook
;;   ((clojure-mode . lispy-mode)
;;    (cider-mode . lispy-mode)
;;    (common-lisp-mode . lispy-mode)))

(use-package smartparens
  :bind (("C-M-f" . 'sp-forward-sexp)
     ("C-M-b" . 'sp-backward-sexp)
     ("C-)" . 'sp-forward-slurp-sexp)
     ("C-(" . 'sp-backward-slurp-sexp)
     ("M-)" . 'sp-forward-barf-sexp)
     ("M-(" . 'sp-backward-barf-sexp)
     ("C-M-s" . 'sp-splice-sexp)
     ("C-S-<SPC>" . 'er/mark-outside-pairs)
     ("C-M-p" . 'sp-backward-up-sexp)
     ("C-M-n" . 'sp-down-sexp))
  :config
  (require 'smartparens-config)
  (smartparens-global-strict-mode t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package projectile
  :hook (prog-mode . projectile-mode))

;;(use-package aggressive-indent
;;  :hook (prog-mode . aggressive-indent-mode))

(which-function-mode t)

(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :init (use-package flycheck-pos-tip
          :hook (flycheck-mode . flycheck-pos-tip-mode)
          :config (setq flycheck-pos-tip-timeout -1)))

(use-package dumb-jump
  :config (setq dumb-jump-selector 'ivy))

(use-package realgud)

;; treemacs: a tree layout file explorer for Emacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :config
  (progn
    (setq treemacs-follow-after-init t
          treemacs-width 35
          treemacs-indentation 1
          treemacs-follow-after-init t
          treemacs-recenter-after-file-follow nil
          treemacs-collapse-dirs (if (executable-find "python") 3 0)
          treemacs-silent-refresh t
          treemacs-silent-filewatch t
          treemacs-change-root-without-asking t
          treemacs-sorting 'alphabetic-desc
          treemacs-show-hidden-files t
          treemacs-never-persist nil
          treemacs-is-never-other-window t
          treemacs-indentation-string (propertize " ⫶ " 'face 'font-lock-comment-face))

    ;; don't show files in .gitignore
    (setq treemacs-python-executable (executable-find "python3"))
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))

  :bind
  (:map global-map
        ([f8] . treemacs)))

(use-package treemacs-projectile
  :after treemacs projectile)
  ;;:bind (:map global-map
  ;;  ("C-c o p" . treemacs-projectile)))

;; recently added config to lsp-mode and lsp-ui

(use-package lsp-mode
  :bind ("C-c h" . lsp-describe-thing-at-point)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; (XXX-mode . lsp)
   (python-mode . lsp)
   (c++-mode . lsp)
   (elixir-mode . lsp)
   ;; lsp-haskell configured in haskell.el
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :init
  (add-to-list 'exec-path "~/Build/elixir/elixir-ls/") ;;"path-to-elixir-ls/release"
  :commands lsp
  :diminish lsp-mode
  :config
  (setq lsp-prefer-flymake nil
	lsp-ui-doc-enable nil))

(use-package company-lsp
  :bind
  ("C-\\" . company-complete)
  :config
  (push 'company-lsp company-backends)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package lsp-ui :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-mode nil
	  lsp-ui-flycheck-enable t))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package dap-mode)

;; (use-package eglot
;;   :init
;;   (add-to-list 'eglot-server-programs '(elixir-mode "/home/amol/Build/elixir/elixir-ls/language_server.sh"))
;;   ;; :hook
;;   ;; ('elixir-mode-hook . 'eglot-ensure)
;;   )
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language
