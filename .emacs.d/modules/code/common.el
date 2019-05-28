(use-package magit)
(use-package eldoc)
(use-package company
  :hook ((prog-mode . company-mode)
	 (cider-repl-mode . company-mode)))
(use-package company-quickhelp
  :after company
  :hook (prog-mode . company-quickhelp-local-mode))
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config (require 'smartparens-config))
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
