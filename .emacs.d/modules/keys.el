;;; keys.el --- keybindings                          -*- lexical-binding: t; -*-

;; Copyright (C) 2020

;; Author:  <amol@hydra>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Should not have any C-c keys

;;; Code:

;; windows
(bind-key (kbd "C-x w r") 'split-window-and-follow-vertically)
(bind-key (kbd "C-x w d") 'split-window-and-follow-horizontally)
(bind-key (kbd "C-x w q") 'delete-window)
(bind-key (kbd "C-x w o") 'delete-other-windows)
(bind-key (kbd "C-x w w") 'ace-window)
;; typing
(bind-key (kbd "M-z") 'zap-up-to-char)
;; undo
(bind-key (kbd "C-z") 'undo-only)
(bind-key (kbd "C-S-z") #'undo)
;; search
(bind-key (kbd "C-s") 'swiper)
;; completion
(bind-key (kbd "C-/") 'company-complete)
;; mark
(bind-key (kbd "C-;") 'er/expand-region)
(bind-key (kbd "C-:") 'er/contract-region)
;; org-mode
(bind-key (kbd "C-c o")
	  (lambda () (interactive) (find-file "~/org/organizer.org")))
(bind-key (kbd "C-c a") 'org-agenda-list)
(bind-key (kbd "C-c s") 'org-store-link)

;; functions
(defun sudo-save ()
  "save the current buffer as a sudo user, overwriting the existing file"
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (write-file (concat "/sudo:root@localhost:" (buffer-file-name)))))

(defun full-buffer-query-replace ()
  "runs query replace on the entire buffer, might be able to make this a macro or something"
  (interactive)
  (let ((old-point (point)))
    (goto-char (point-min))
    (call-interactively `query-replace-regexp)
    (goto-char old-point)))
(defun split-window-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-window-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(provide 'keys)
;;; keys.el ends here
