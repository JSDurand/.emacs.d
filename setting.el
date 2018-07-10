(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
;; (setq coding-system-for-read 'utf-8 )	; use utf-8 by default
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Hello!") ; print a default message in the empty scratch buffer opened at startup

(setq-default display-line-numbers 'relative)
(setq-default display-line-numbers-current-absolute t)
(global-set-key [?\s-x] (lambda ()
			      (interactive)
			      (if (eq display-line-numbers 'relative)
				  (setq display-line-numbers nil)
				(setq display-line-numbers 'relative))))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(global-set-key "\M-'" 'insert-quotations)
(global-set-key "\M-\"" 'insert-quotes)
;; (global-set-key (kbd "C-'") 'insert-backquote)

(defun insert-quotations (&optional arg)
  "Enclose following ARG sexps in quotation marks.
Leave point after open-paren."
  (interactive "*P")
  (insert-pair arg ?\' ?\'))

(defun insert-quotes (&optional arg)
  "Enclose following ARG sexps in quotes.
Leave point after open-quote."
  (interactive "*P")
  (insert-pair arg ?\" ?\"))

(defun insert-backquote (&optional arg)
  "Enclose following ARG sexps in quotations with backquote.
Leave point after open-quotation."
  (interactive "*P")
  (insert-pair arg ?\` ?\'))

(defun copy-line (arg)
  "Copy line accoring to ARG"
  (interactive "p")
  (let ((beg (line-beginning-position))
	(end (line-end-position arg)))
    (kill-ring-save beg end nil)
    (kill-append "\n" nil)))


(global-set-key [?\M-k] 'copy-line)

(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))
(global-set-key [?\C-c ?/] 'indent-region-or-buffer)

(defun backward-kill-line (arg)
  "Kill ARG lines backward"
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key [?\\] 'self-insert-command)
(global-set-key [s-backspace] 'backward-kill-line)
(global-set-key [?\C--] 'undo)
(global-set-key [f12] 'undo)

;;;(set-face-attribute 'default (selected-frame) :height 120)
;;;(set-face-attribute 'mode-line nil :height 200)
(set-default-font "Menlo 20")

(defun my-minibuffer-setup ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :height 1.1))))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup)

(with-current-buffer (get-buffer " *Echo Area 0*") 
  (setq-local face-remapping-alist '((default (:height 1.2) variable-pitch))))

(with-current-buffer (get-buffer " *Echo Area 1*")
  (setq-local face-remapping-alist '((default (:height 1.2) variable-pitch))))

(global-set-key [?\s-w] 'delete-other-windows)
(defun scroll-half-page-down ()
  "scroll down half the page"
  (interactive)
  (scroll-down (/ (window-body-height) 2)))

(defun scroll-half-page-up ()
  "scroll up half the page"
  (interactive)
  (scroll-up (/ (window-body-height) 2)))

(use-package org :ensure t)
(setq org-todo-keywords '((sequence "TODO" "START" "WORKING" "HARD-WORKING" "ALMOST" "|" "DONE")))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(defun org-advance (x)
  (interactive "P")
  (when (buffer-narrowed-p)
    (beginning-of-buffer)
    (widen)
    (if (not x)
	(org-next-visible-heading 1)
      (org-forward-heading-same-level 1)))
  (org-narrow-to-subtree))

(defun org-retreat (x)
  (interactive "P")
  (when (buffer-narrowed-p)
    (beginning-of-buffer)
    (widen)
    (if (not x)
	(org-previous-visible-heading 1)
      (org-backward-heading-same-level 1)))
  (org-narrow-to-subtree))

(add-hook 'org-mode-hook '(lambda ()
			   (define-key org-mode-map [?\ù] 'org-advance)
			   (define-key org-mode-map [?\ç] 'org-retreat)))

(defun org-get-account-num ()
  "count how many days have been tagged 'account'"
  (interactive)
  (length (org-map-entries t "account")))

(defun org-get-account-total ()
  "get the total value of the accuont values"
  (interactive)
  (apply '+ (mapcar 'string-to-number
		    (org-map-entries (lambda ()
				       (org-entry-get nil "TOTAL")) "account"))))

(defun org-calc-account ()
  "sum up my accounts entries, one can limit the entries to sum by the tag 'account'"
  (interactive)
  (let* ((days (org-get-account-num))
	 (total (org-get-account-total))
	 (ave (/ total days)))
    (message (concat
	      (number-to-string days)
	      " days, spent "
	      (number-to-string total)
	      " with average "
	      (number-to-string ave)))))
(define-key org-mode-map [f8] 'org-calc-account)

(advice-add 'org-edit-special :after '(lambda (orig-fun) (delete-other-windows)))

;; just in case I need this
(defun org-retrieve-value ()
  "retrieve value from property drawer"
  (org-element-map (org-element-parse-buffer) 'property-drawer (lambda (hl)
								 (nth 3 (nth 1 (assoc 'node-property hl))))))
(set-face-attribute 'org-block nil :background "lightblue" :foreground "black")

(toggle-truncate-lines -1)
(global-set-key (kbd "C-c h") 'beginning-of-buffer)
(global-set-key (kbd "C-c g") 'end-of-buffer)
(global-set-key (kbd "C-c j") 'delete-indentation)
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-F") 'forward-word)
(global-set-key (kbd "s-(") 'backward-paragraph)
(global-set-key (kbd "s-)") 'forward-paragraph)
(global-set-key (kbd "<f10>") 'save-buffer)
(global-set-key (kbd "s-b") '(lambda ()
			       "switch to the most recent buffer"
			       (interactive)
			       (switch-to-buffer (other-buffer))))
(global-set-key (kbd "s-B") 'switch-to-buffer)
(global-set-key (kbd "s-k") '(lambda ()
			       "kill recent buffer"
			       (interactive)
			       (kill-buffer (current-buffer))))
(global-set-key (kbd "s-K") 'kill-buffer)
(global-set-key [?\s-j] '(lambda ()
			   "join line backwards, as I am more used to that
				 behaviour."
			   (interactive)
			   (join-line -1)))
(global-set-key [?\M-&] 'query-replace-regexp)
(defun open-line-below ()
  "C-o in vim"
  (interactive)
  (progn
    (end-of-line)
    (open-line 1)
    (forward-line)
    (indent-according-to-mode)))
(global-set-key [?\C-o] 'open-line-below)
(add-hook 'dired-mode-hook 'dired-hide-details-mode)
(setq make-backup-files nil)
(defun eval-rep ()
  "my eval replace"
  (interactive)
  (kill-sexp -1)
  (insert (format "%S" (eval (read (current-kill 0))))))
(global-set-key [?\M-\s-ê] 'eval-rep)
(add-hook 'lisp-mode-hook 'show-paren-mode)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; (add-hook 'clojure-mode-hook 'show-paren-mode)
(add-hook 'lisp-interaction-mode-hook 'show-paren-mode)
(global-set-key [?\C-c ?v] 'view-mode)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(global-set-key [?\C-x ?r ?s] 'bookmark-save)
(global-set-key [?\M-Z] 'zap-up-to-char)
(setq flyspell-issue-message-flag nil)

;; (load-theme 'leuven)
;; (load-theme 'nimbus t)
(load-theme 'nimbus-tex-im t)
;; (load-theme 'default-black)
;; (load-theme 'my_theme t)

(global-set-key "\M-m" 'iy-go-to-char)
(global-set-key "\M-p" 'iy-go-to-char-backward)

(global-set-key (kbd "C-$") 'er/expand-region)
(pending-delete-mode t)

(global-company-mode)
(global-set-key (kbd "C-x <") 'company-complete)
(with-eval-after-load 'company
  (company-flx-mode +1))

(defun tex ()
  "my own command to compile tex"
  (interactive)
  (call-process "/bin/bash" nil nil nil "-c" (format "xetex %s" (shell-quote-argument buffer-file-name))))

(setq use-package-always-ensure t)
(use-package auctex
  :defer t
  :ensure t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)
(customize-set-variable 'LaTeX-math-abbrev-prefix (kbd "£"))
(add-hook 'TeX-mode-hook '(lambda ()
			    (define-key TeX-mode-map [?\§] '(lambda () "remap to type escape key" (interactive) (insert "\\")))
			    (define-key TeX-mode-map [f9] 'tex)
			    (define-key TeX-mode-map [?\)] 'end-exit-paren)
			    (define-key TeX-mode-map [?\(] 'open-paren)
			    (define-key TeX-mode-map [?\C-c ?d] 'insert-def)
			    (define-key TeX-mode-map [?\C-c ?o] 'one-def)
			    (define-key TeX-mode-map [?\C-c ?t] 'two-def)
			    (define-key TeX-mode-map [?\C-c ?r] 'read-tex-complete)))
(defun end-exit-paren ()
  "use closing pasenthesis to exit the parenthesis"
  (interactive)
  (let ((ch (char-after nil)))
    (cond ((eq ch ?\)) (forward-char))
	  ((eq ch ?\}) (forward-char))
	  ((eq ch ?\]) (forward-char))
	  (t (insert ")")))))

(defun open-paren ()
  "open parenthesis inserts a matching pair"
  (interactive)
  (progn
    (insert "()")
    (backward-char)))

(defun insert-def ()
  "my function to insert defs of tex documents easily"
  (interactive)
  (let ((name (read-string "Enter macro name: "))
	(body (buffer-substring-no-properties (mark) (point))))
    (if (use-region-p)
	(progn (kill-region (region-beginning) (region-end))
	       (insert (format "\\%s" name))
	       (save-excursion
		 (goto-char (point-min))
		 (setq temp (search-forward-regexp "^\\\\def" nil t))
		 (when temp
		   (message "Macro inserted.")
		   (forward-paragraph)
		   (insert (format "\\def\\%s{%s}\n" name body))))
	       (if (not temp)
		   (save-excursion (message "No defs found, insert in the above paragragh.")
				   (backward-paragraph)
				   (insert (format "\n\\def\\%s{%s}" name body)))))
      (message "Please activate region which contains the definiton before inserting the def"))))
(defun one-def ()
  "insert defonetext instead of def"
  (interactive)
  (let ((name (read-string "Enter macro name: ")))
    (progn (insert (format "\\%s" (downcase name)))
	   (save-excursion
	     (goto-char (point-min))
	     (setq temp (search-forward-regexp "^\\\\def" nil t))
	     (when temp
	       (message "Macro inserted.")
	       (forward-paragraph)
	       (insert (format "\\defonetext{%s}\n" name))))
	   (if (not temp)
	       (save-excursion (message "No defs found, insert in the above paragragh.")
			       (backward-paragraph)
			       (insert (format "\n\\defonetext{%s}" name)))))))

(defun two-def ()
  "insert deftwotext instead of def"
  (interactive)
  (let ((name (downcase (read-string "Enter macro name: ")))
	(body (buffer-substring-no-properties (mark) (point))))
    (if (use-region-p)
	(progn (kill-region (region-beginning) (region-end))
	       (insert (format "\\%s" name))
	       (save-excursion
		 (goto-char (point-min))
		 (setq temp (search-forward-regexp "^\\\\def" nil t))
		 (when temp
		   (message "Macro inserted.")
		   (forward-paragraph)
		   (insert (format "\\deftwotext{%s}{%s}\n" name body))))
	       (if (not temp)
		   (save-excursion (message "No defs found, insert in the above paragragh.")
				   (backward-paragraph)
				   (insert (format "\n\\deftwotext{%s}{%s}" name body)))))
      (message "Please activate region which contains the definiton before inserting the def"))))

(defun get-defs ()
  "Collect all the defs in the tex document"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (let ((res '()))
      (while (re-search-forward "^\\\\def" nil t)
	(let ((s (buffer-substring-no-properties (- (point) 4)
						 (progn
						   (end-of-line)
						   (point)))))
	  (setq res (cons s res))))
      res)))

(defun find-macro-name (x)
  "find the name of a tex macro"
  (let* ((ind (string-match "{" x))
	 (content (substring x 0 ind)))
    (cond
     ((string-equal content "\\defonetext")
      (concat "\\" (downcase (substring x (+ 1 ind) (string-match "}" x)))))
     ((string-equal content "\\deftwotext")
      (concat "\\" (downcase (substring x (+ 1 ind) (string-match "}" x)))))
     (t
      (substring x 4 ind)))))

(defun read-tex-complete ()
  "my function to find all defs and use ivy as backend to complete it, assuming all defs come at the beginning of line"
  (interactive)
  (ivy-read "defs: "
	    (get-defs)
	    :action '(1
		      ("o" (lambda (x)
			     (insert (format "%s" (find-macro-name x))))
		       "Default action: insert macro name.")
		      ("m" (lambda (x)
			     (message (format "%s" (find-macro-name x))))
		       "Message the macro name instead of inserting it."))))

(wrap-region-global-mode t)
(wrap-region-add-wrapper "$" "$")
;; (wrap-region-add-wrapper "=" "=")
;; (wrap-region-add-wrapper "-" "-")

;; (global-set-key (kbd "C-c )") 'paredit-forward-barf-sexp)
;; (global-set-key (kbd "C-c (") 'paredit-backward-barf-sexp)
;; (global-set-key [?\C-\(] 'paredit-mode)

(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
(setq yas-snippet-dirs '("~/.emacs.d/my_snippets"))
(yas-global-mode t)

(global-set-key (kbd "C-<") 'mc/mark-next-like-this)
(global-set-key (kbd "M-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c M-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(fset 'ud
   [?\C-c ?g ?\C-r ?t ?b ?l ?f ?m return ?\C-c ?\C-c ?\C-r ?t ?b ?l ?f ?m return ?\C-c ?\C-c ?\C-r ?s ?u ?m return tab ?\C-$ ?\M-w ?\C-c ?\C-p ?\C-c ?\C-x ?P ?t ?o ?t ?a ?l ?: ?  ?\C-y ?\C-\M-j])
(fset 'na
   [?c ?\C-x ?u ?\C-c ?g ?\C-c ?\C-p ?\C-c ?\C-x ?\M-w ?\C-c ?g ?\C-c ?\C-x ?\C-y tab ?\M-m ?< S-right ?\C-n ?\C-n ?\C-n ?\C-n ?\M-m ?< S-right ?\C-n ?\C-n ?\M-p ?< S-right ?\C-n ?\C-n ?\C-n ?\C-n ?\C-n tab ?l ?u ?n ?c ?h tab ?0 tab ?t ?o ?  ?d ?o tab])

(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key [?\s-s] 'swiper)
(setq ivy-count-format "(%d/%d) ")
(global-set-key [?\s-f] 'counsel-find-file)
(global-set-key [?\M-x] 'counsel-M-x)
(with-eval-after-load 'ivy
  (setq ivy-re-builders-alist
	'((t . ivy--regex-fuzzy)
	  (swiper . ivy--regex-plus))))
(defun kill-from-recentf (buf)
  "remove the buffer from the recentf list"
  (interactive)
  (if (get-buffer buf)
      (kill-buffer buf)
    (setq recentf-list (delete (cdr (assoc buf ivy--virtual-buffers)) recentf-list))))

(ivy-set-actions
 'ivy-switch-buffer
 '(("k"
    (lambda (x)
      (kill-from-recentf x)
      (ivy--reset-state ivy-last))
    "kill")))

(column-number-mode 1)
(set-face-attribute 'mode-line-buffer-id nil :background "deep sky blue"
		    :foreground "orange")
(set-face-attribute 'mode-line-highlight nil :box nil :background "deep sky blue")
(set-face-attribute 'mode-line-inactive  nil :background "gray" :foreground "black")

(setq mode-line-position
      '(;; %p print percent of buffer above top of window, or Top, Bot or All
	;; (-3 "%p")
	" "
	;; %I print the size of the buffer, with kmG etc
	;; (size-indication-mode ("/" (-4 "%I")))
	;; " "
	;; %l print the current line number
	;; %c print the current column
	(line-number-mode ("%l" (column-number-mode ":%c")))))

(setq-default mode-line-buffer-identification
	      (propertized-buffer-identification " %b "))

(defun my-mode-line-modified ()
  (concat
   (if (and (buffer-modified-p)
	    (not (string-prefix-p "*" (buffer-name))))
       "US "
     (if (string-prefix-p "*" (buffer-name))
	 "NO "
       " "))
   (if buffer-read-only
       "RO "
     " ")))

(setq-default mode-line-format
	      '("%e"
		mode-line-front-space
		;; mode-line-mule-info -- I'm always on utf-8
		mode-line-client
		(:eval (my-mode-line-modified))
		;; mode-line-remote -- no need to indicate this specially
		;; mode-line-frame-identification -- this is for text-mode emacs only
		" "
		mode-line-buffer-identification
		" "
		;; mode-line-position
		;;(vc-mode vc-mode)  -- I use magit
		;; (flycheck-mode flycheck-mode-line) -- I don't have this
		" %m " ;; Only major mode
		mode-line-misc-info
		mode-line-end-spaces
		;; mode-line-modes -- I don't want all those minor modes information
		))
(set-face-attribute 'mode-line nil
		    :background "light blue" :foreground "black" :height 1.3)

;; (use-package parinfer
;;   :ensure t
;;   :bind
;;   (("C-," . parinfer-toggle-mode))
;;   :init
;;   (progn
;;     (setq parinfer-extensions
;; 	  '(defaults       ; should be included.
;; 	     pretty-parens  ; different paren styles for different modes.
;; 	     paredit        ; Introduce some paredit commands.
;; 	     smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
;; 	     smart-yank))   ; Yank behavior depend on mode.
;;     (add-hook 'clojure-mode-hook #'parinfer-mode)
;;     (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
;;     (add-hook 'lisp-interaction-mode-hook #'parinfer-mode)
;;     (add-hook 'lisp-mode-hook #'parinfer-mode)))

;; (defun indent-between-parens ()
;;   "try to implement a function to auto-indent between parens"
;;   (interactive)
;;   (let ((cur (current-column)))
;;     (save-excursion
;;       (next-line -1)
;;       (if (search-forward "(" nil t)
;; 	  (setq temp (current-column))
;; 	(setq temp cur)))  
;;     (insert (make-string (- temp cur 1) ? ))))

;; (defun dedent-between-parens ()
;;   "try to implement a function to auto-indent between parens"
;;   (interactive)
;;   (let ((cur (current-column)))
;;     (save-excursion
;;       (next-line -1)
;;       (if (search-backward "(" nil t)
;; 	  (setq temp (current-column))
;; 	(setq temp cur)))  
;;     (backward-delete-char (- cur temp))))

(add-hook 'emacs-lisp-mode-hook 'lispy-mode)
(add-hook 'lisp-mode-hook 'lispy-mode)
(add-hook 'lisp-interaction-mode-hook 'lispy-mode)

(defun test ()
  "just to test"
  (interactive)
  (ivy-read "test" '(("First option" "first text" "option 1")
		     ("Second option" "second text") ("third" "third text" "option 2")
		     ("and fourth option" "fourth text" "fourth option"))
	    :action '(1
		      ("o" (lambda (x)
			     (interactive)
			     (with-ivy-window
			       (insert (format "%s" (elt x 1)))))
		       "hey")
		      ("p" (lambda (x)
			     (interactive)
			     (with-ivy-window
			       (insert (format "%s" (elt x 2)))))
		       "haaaa"))))

(global-set-key [?\C-x ?g] 'magit-status)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(with-eval-after-load "slime"
  (define-key slime-mode-map [?\C-x ?\C-e] 'slime-eval-last-expression))
