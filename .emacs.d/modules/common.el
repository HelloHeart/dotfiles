(use-package swiper)
(use-package ivy
  :init (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d "
	ivy-display-style 'fancy))
(use-package counsel
  :init (counsel-mode))
(use-package smex)
(use-package which-key
  :init (which-key-mode)
  :config (which-key-add-key-based-replacements
	   (kbd "C-c o") "open organizer"))
(use-package undohist
  :config (undohist-initialize))
(use-package expand-region)
(use-package ws-butler)
(ws-butler-global-mode)
(use-package ag)
(use-package keyfreq
  :init
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1)
  :config
  (setq keyfreq-excluded-commands
	'(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line)))
