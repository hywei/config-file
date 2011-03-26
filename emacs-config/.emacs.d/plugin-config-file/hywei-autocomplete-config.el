;; auto-complete setting
(add-to-list 'load-path
             "~/.emacs.d/plugins/auto-complete")
(add-to-list 'load-path
             "~/.emacs.d/plugins/auto-complete/dict")
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-yasnippet)
 
(defun auto-complete-settings ()
  "Settings for `auto-complete'."
  ;; After do this, isearch any string, M-: (match-data) always
  ;; return the list whose elements is integer
  (global-auto-complete-mode 1)
 
  ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
  ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
  ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
  (apply-define-key
   ac-complete-mode-map
   `(("<return>"   nil)
	 ("RET"		nil)
	 ("M-j"		ac-complete)
	 ("<C-return>" ac-complete)
	 ("M-n"		ac-next)
	 ("M-p"		ac-previous)))
 
  (setq ac-dwim t)
  (setq ac-candidate-max ac-candidate-menu-height)
 
  (set-default 'ac-sources
			   '(ac-source-semantic
				 ac-source-yasnippet
				 ac-source-abbrev
				 ac-source-words-in-buffer
				 ac-source-words-in-all-buffer
				 ac-source-imenu
				 ac-source-files-in-current-dir
				 ac-source-filename))
  (setq ac-modes ac+-modes)
 
  (dolist (command `(backward-delete-char-untabify delete-backward-char))
	(add-to-list 'ac-trigger-commands command))
 
  (defun ac-start-use-sources (sources)
	(interactive)
	(let ((ac-sources sources))
	  (call-interactively 'ac-start)))
 
  (defvar ac-trigger-edit-commands
	`(self-insert-command
	  delete-backward-char
	  backward-delete-char
	  backward-delete-char-untabify)
	"*Trigger edit commands that specify whether `auto-complete' should start or not when `ac-completing'."))

(global-auto-complete-mode t)


(add-to-list 'load-path
             "~/.emacs.d/plugins")
(require 'gccsense)
(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'gccsense-complete)
            ;; or
            (local-set-key (kbd "C-c .") 'ac-complete-gccsense)))