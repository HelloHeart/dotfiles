(setq org-agenda-files '("~/org/")
      org-log-done 'time
      org-enforce-todo-dependencies t
      org-agenda-timegrid-use-ampm 1
      org-agenda-start-day nil
      org-agenda-start-on-weekday nil
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      ;; org-agenda-include-diary t
      org-agenda-block-separator t
      org-agenda-compact-blocks t
      org-agenda-start-with-log-mode t
      org-agenda-format-date (lambda (date) (concat "\n"
						    (make-string (window-width) 9472)
						    "\n"
						    (org-agenda-format-date-aligned date)))
      org-todo-keywords '((sequence "TODO" "|" "DONE")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   ;; ...
   (python . t)
   (scheme . t)))

(use-package org-super-agenda
  :after org
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups '((:name "Overdue"
					 :deadline past)
				  (:name "Due Today"
					 :deadline today)
				  (:name "Today"
				  	 :time-grid t
				  	 :date today
					 :scheduled today)
				  (:auto-parent))))

(use-package org-wild-notifier
  :config
  (setq ;;org-wild-notifier-alert-time 1
   alert-default-style 'libnotify
   alert-persist-idle-time 60
   alert-fade-time 60
   )
  (org-wild-notifier-mode))

(setq org-agenda-custom-commands
      '(("d" "Daily view"
	 ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :todo "TODAY"
                                :scheduled today
                                :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
				 :todo "NEXT")
			  (:name "Overdue"
                                 :deadline past)
			  (:name "Due Today"
                                 :deadline today)
			  (:name "Assignments"
                                 :tag "Assignment"
				 :deadline future)
			  (:name "Due Soon"
                                 :deadline future)
                          (:name "Important"
                                 :tag "Important"
                                 :priority "A")
                          (:name "Projects"
                                 :tag "Project")
                          (:name "To Read"
                                 :tag "Book")
                          (:name "On Hold"
                                 :todo "ON HOLD")
                          (:name "trivial"
                                 :priority<= "C"
                                 :tag ("Trivial" "Unimportant")
                                 :todo ("SOMEDAY" ))
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))
