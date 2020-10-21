(use-package elpy
  :init (elpy-enable)
  :config (setq python-shell-interpreter "python3")
  (add-hook 'python-mode-hook (lambda () (add-hook 'after-save-hook 'elpy-autopep8-fix-code))))
;; pip3 install jedi rope flake8 autopep8 yapf black
;; looks like there's a problem with black, for now ignore it
