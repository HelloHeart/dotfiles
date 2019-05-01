(use-package magit)
(use-package eldoc)
(use-package company
  :hook ((prog-mode . company-mode)))
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
