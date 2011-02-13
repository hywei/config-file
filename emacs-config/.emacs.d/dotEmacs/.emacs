;;语法加亮
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


 ;; Emacs Load Path
(setq load-path (cons "/home/hywei/Sofeware/emacs/site-lisp" load-path))
(setq load-path (cons "~/.emacs.d" load-path))

;;每次打开上次的窗口
;;(desktop-save-mode 1)

;;启动最大化
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;; use text-mode as default
(setq default-major-mode 'text-mode)


;;显示行号
(global-linum-mode 1)

;;去除工具条
(tool-bar-mode nil) 

;;不显示欢迎画面
(setq inhibit-startup-message t)

;;关闭烦人的出错时的提示声
(setq visible-bell t)

;;关闭buffer后删除临时文件
(setq delete-auto-save-files t)

;;显示行列号
(setq column-number-mode t)
(setq line-number-mode t)

(setq kill-ring-max 200)

(setq default-fill-column 80)

(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

(mouse-avoidance-mode 'animate)

;; 设置背景色和前景色
(set-face-background 'default "black")
(set-face-foreground 'default "white")

;; 光标不要太粗
(setq-default cursor-type 'bar)

;;可以匹配括号,但不会移动到另一边
(show-paren-mode t)
(setq show-paren-style 'parentheses)


(setq frame-title-format "Emacs : %b")

;;还有2行的时候屏幕开始滚动
(setq scroll-margin 2 scroll-conservatively 10000)

;;用户名和e-mail
(setq user-full-name "weihongyu")
(setq user-mail-address "weihongyu1987@gmail.com")

;;默认模式为text-mode
(setq default-major-mode 'text-mode)

;;不备份文件
(setq make-backup-files nil)

;;高亮选择区域
(transient-mark-mode t)

;;不使用yes/no,而是用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;自动处理图片
(auto-image-file-mode)

;;加密显示密码
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; 字体设置
(set-default-font 
      "-bitstream-Bitstream Vera Sans-normal-normal-normal-*-20-*-*-*-*-0-iso10646-1")
;     "-unknown-DejaVu Sans Mono-normal-normal-normal-*-25-*-*-*-m-0-iso10646-1")
;; set sample texts for "Display Faces"

;; color theme
(load "/home/hywei/Software/emacs/site-lisp/color-theme.el")
(require 'color-theme)
(setq color-theme-is-global t)
;(color-theme-robin-hood)
(defun color-theme-face-attr-construct (face frame)
       (if (atom face)
           (custom-face-attributes-get face frame)
         (if (and (consp face) (eq (car face) 'quote))
             (custom-face-attributes-get (cadr face) frame)
           (custom-face-attributes-get (car face) frame))))

(color-theme-dark-vee)
;tabbar
;;(require 'tabbar)
;;(tabbar-mode)
;;(setq tabbar-buffer-groups-function
;;         (lambda (buffer)
;;           (list "All buffers")))

;;时间显示设置
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(setq display-time-format "%m月%d日%A%H:%M")

;; c/c++ setting
(require 'cc-mode)
(load "/home/hywei/Software/emacs/site-lisp/google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; http://www.bloomington.in.us/~brutt/emacs-c-dev.html
;; compile hot key setting
(global-set-key [(f7)] 'compile)
;; set compilation-window-height
(setq compilation-window-height 8)
;; make the compilation window go away if no errors
(setq compilation-finish-function
      (lambda (buf str)
        (if (string-match "exited abnormally" str)
            ;;there were errors
            (message "compilation errors, press C-x ` to visit")
          ;;no errors, make the compilation window go away in 0.5 seconds
          (run-at-time 0.5 nil 'delete-windows-on buf)
          (message "NO COMPILATION ERRORS!"))))
(c-toggle-hungry-state 1)

;; yasnippet setting
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; auto-complete setting
(add-to-list 'load-path
             "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;; auto-install setting
(add-to-list 'load-path
             "~/.emacs.d/plugins/auto-install")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/plugins/auto-install/");



;; auctex setting
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; set evince as the default pdf viewer  ( hot-key: c-c c-v)
(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
;; set xelatex as the default compile command (hot-key: c-c c-c)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "XeLaTeX")))
