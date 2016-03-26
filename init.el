(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

;evil
(require 'evil)
  (evil-mode 1)
(define-key evil-motion-state-map "\C-]" nil)
(define-key evil-motion-state-map "\C-j" 'evil-window-down)
(define-key evil-motion-state-map "\C-k" 'evil-window-up)
(define-key evil-motion-state-map "\C-l" 'evil-window-right)
(define-key evil-motion-state-map "\C-h" 'evil-window-left)

;info
(define-key Info-mode-map (kbd "w") nil)
(define-key Info-mode-map (kbd "b") nil)

;relative num
(require 'linum-relative)
(global-linum-mode 1)
(linum-relative-mode 1)

;auto-complete
(require 'auto-complete)
(ac-config-default)

;cal-china-x
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-auto-cleanup 'never)
(setq recentf-max-menu-items 30)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;cscope
(require 'xcscope)
(global-unset-key (kbd "\C-]"))
(global-unset-key (kbd "\C-\\"))
(global-set-key (kbd "\C-]") 'cscope-find-this-symbol)
(global-set-key (kbd "<f4>") 'cscope-create-list-of-files-to-index)
(global-set-key (kbd "C-\\ s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-\\ d") 'cscope-find-global-definition)
(global-set-key (kbd "C-\\ f") 'cscope-find-functions-calling-this-function)
;(setq cscope-display-cscope-buffer t)
;(setq cscope-initial-directory "~/.emacs_autotags")

; sr-speedbar 查看c代码定义
(require 'sr-speedbar)
(global-set-key (kbd "<f5>") 'sr-speedbar-toggle)
(setq sr-speedbar-skip-other-window-p t)

;which-key
(require 'which-key)
(which-key-mode)

;asciidoc
(require 'adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

;o-bog
(require 'o-blog)

;blink
(blink-cursor-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(send-mail-function nil)
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "文泉驿等宽正黑" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq auto-save-default nil)
(setq make-backup-files nil)

; org-mode
(setq org-export-with-sub-superscripts (quote {}))
(setq org-src-preserve-indentation t)
(setq org-src-fontify-natively t)
(setq org-log-done t)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list
                        "~/github/hello/work.org"))
(add-hook 'org-mode-hook
    (lambda () (setq truncate-lines nil)))
(setq org-log-done t)
(setq org-todo-keywords
  '((sequence "TODO" "FEEDBACK" "|" "DONE" "DELEGATED")))

(if (eq system-type 'gnu/linux)
    (set-default-font "文泉驿等宽正黑 13")
    (set-fontset-font "fontset-default" 'unicode "文泉驿等宽正黑 20")
    )

(if (eq system-type 'darwin)
    (set-default-font "Monaco 16")
    (set-fontset-font "fontset-default" 'unicode "WenQuanYi Bitmap Song 16")
 )

(setq display-time-24hr-format t)
; 自动对齐
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)
(setq-default c-basic-offset 4)
(setq c-default-style "linux"
          c-basic-offset 4)


; 窗口最大化
(toggle-frame-maximized)
; 滚屏移动1行，不是中间
(setq scroll-step 1)

;; ===============有道词典配置====================
;; Enable Cache
(setq url-automatic-caching t)

;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

;; Integrate with popwin-el (https://github.com/m2ym/popwin-el)
;; (push "*Youdao Dictionary*" popwin:special-display-config)

;; Set file path for saving search history
;; (setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")

;; Enable Chinese word segmentation support (支持中文分词)
;; (setq youdao-dictionary-use-chinese-word-segmentation t)
;; ===============有道词典配置====================

; bing词典
(require 'bing-dict)
(global-set-key (kbd "C-c d") 'bing-dict-brief)
(global-set-key (kbd "<f12>") 'bing-dict-brief)

; 透明背景(mac有用，centos上没用)
(set-frame-parameter (selected-frame) 'alpha '(80 100))
(add-to-list 'default-frame-alist '(alpha 80 100))

; 透明背景
(require 'seethru)
(seethru 55)

; 黄金分割窗口
(require 'golden-ratio)

; 编码方式
(prefer-coding-system 'gb2312)
(prefer-coding-system 'utf-8)

; 快捷键取消绑定
;(dolist (key '("\C-o" "\c-i"))
;  (global-unset-key))

