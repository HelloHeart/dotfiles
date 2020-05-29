(use-package magit)
(use-package eldoc)
(use-package company
  :hook ((prog-mode . company-mode)
	 (cider-repl-mode . company-mode)))
(use-package company-box
  :hook (company-mode . company-box-mode))
(use-package company-quickhelp
  :after company
  :hook (prog-mode . company-quickhelp-local-mode))
(use-package smartparens
  :bind (("C-c C-<right>" . sp-slurp-hybrid-sexp)
	 ("C-c C-<left>" . sp-forward-barf-sexp))
  :config
  (require 'smartparens-config))
(smartparens-global-strict-mode)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package projectile
  :hook (prog-mode . projectile-mode))
(use-package aggressive-indent
  :hook (prog-mode . aggressive-indent-mode))
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
  :after treemacs projectile
  ;;:bind (:map global-map
  ;;  ("C-c o p" . treemacs-projectile)))
  )

(use-package lsp-mode
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ;; (XXX-mode . lsp)
	 (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
