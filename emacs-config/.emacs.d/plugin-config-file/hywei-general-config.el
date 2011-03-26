;;语法加亮
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; set encoding
(prefer-coding-system 'utf-8)

;; use text-mode as default
(setq default-major-mode 'text-mode)

;;每次打开上次的窗口
;;(desktop-save-mode 1)

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

;; cursor color
(set-cursor-color "yellow")
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
