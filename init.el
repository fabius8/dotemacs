;;; package --- Summary
;;; Commentary:
; list the packages you want
(setq package-list '(multi-term xclip highlight-parentheses
                     highlight-symbol ggtags helm web-mode
                     xcscope which-key sr-speedbar smex
                     relative-line-numbers projectile
                     markdown-mode magit gtags git-gutter
                     finder+ fill-column-indicator f evil
                     company cal-china-x bing-dict auto-complete
                     anzu adoc-mode))

; list the repositories containing them
(require 'package)
(setq package-archives
      '(("elpa" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;evil
(require 'evil)
  (evil-mode 1)
(define-key evil-motion-state-map "\C-]" nil)
(define-key evil-motion-state-map "\C-j" 'evil-window-down)
(define-key evil-motion-state-map "\C-k" 'evil-window-up)
(define-key evil-motion-state-map "\C-l" 'evil-window-right)
(define-key evil-motion-state-map "\C-h" 'evil-window-left)
(define-key evil-insert-state-map "\C-n" 'next-line)
(define-key evil-insert-state-map "\C-p" 'previous-line)
(define-key evil-insert-state-map "\C-v" 'scroll-up-command)
;;(define-key evil-emacs-state-map [escape] 'evil-exit-emacs-state)
;;(defalias 'evil-insert-state 'evil-emacs-state)
;;(fset 'evil-insert-state 'evil-emacs-state)
(define-key evil-motion-state-map "\C-i" 'evil-jump-forward)

;; ;; smex混乱命令输入
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;                   ; when Smex is auto-initialized on its first run.
;; (global-set-key (kbd "M-x") 'smex)

;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/zsh")

;finder+
(require 'finder+)

;; mgit
;;(require 'magit)

;; c 语言一航最多80个字符
(require 'fill-column-indicator)
(setq-default fill-column 80)
(add-hook 'c-mode-hook (lambda() (fci-mode 1)))

;; 显示 tab 字符
(require 'whitespace)
;;(setq whitespace-style
;;      '(tabs trailing space-before-tab
;;        indentation empty space-after-tab tab-mark))
(setq whitespace-style '(face trailing tabs))
(global-whitespace-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(package-selected-packages
   (quote (xclip which-key web-mode sr-speedbar smex
           relative-line-numbers projectile
           markdown-mode magit icicles highlight-symbol
           highlight-parentheses helm-fuzzy-find
           helm-cscope gtags git-gutter ggtags finder+
           fill-column-indicator f evil company cal-china-x
           bing-dict auto-complete anzu adoc-mode)))
 '(send-mail-function nil)
 '(show-trailing-whitespace t))

;; 去除 warning, TODO
;;(setq warning-minimum-level :emergency)

;;evil highlight
;;(require 'evil-search-highlight-persist)
;;(global-evil-search-highlight-persist t)

;;info
(define-key Info-mode-map (kbd "w") nil)
(define-key Info-mode-map (kbd "b") nil)

;; helm
(helm-mode 1)
(global-set-key "\C-x\ \C-r" #'helm-recentf)
(global-set-key "\C-x\ \C-f" #'helm-find-files)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-x") #'helm-M-x)
(setq helm-mode-fuzzy-match 1)
(setq helm-M-x-fuzzy-match 1)
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-j") 'helm-select-action)
;;(define-key helm-map (kbd "DEL") 'helm-recenter-top-bottom-other-window)

;; 显示列号
(column-number-mode)

;git-gutter
(global-git-gutter-mode 1)
;; git-gutter quick find next and previous
(global-set-key (kbd "C-c g n") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)

;auto-complete
(require 'auto-complete)
(ac-config-default)
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)

(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;cal-china-x
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-important-holidays)

;; ;recentf
;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-auto-cleanup 'never)
;; (setq recentf-max-menu-items 30)
;; ;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; dired-mode
(add-hook 'dired-mode-hook (lambda () (evil-emacs-state)))

;cscope
(require 'xcscope)
;;(setq cscope-program "gtags-cscope")
(global-unset-key (kbd "\C-]"))
(global-unset-key (kbd "\C-\\"))
(global-set-key (kbd "\C-]") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "<f4>") 'cscope-create-list-of-files-to-index)
(global-set-key (kbd "C-\\ s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-\\ d") 'cscope-find-global-definition)
(global-set-key (kbd "C-\\ f") 'cscope-find-functions-calling-this-function)
(setq cscope-close-window-after-select t)
(setq cscope-display-cscope-buffer t)
;(setq cscope-initial-directory "~/.emacs_autotags")
(add-hook 'cscope-list-entry-hook 'evil-emacs-state)
(define-key cscope-list-entry-keymap "q" 'kill-buffer-and-window)
(define-key cscope-list-entry-keymap "j" 'nil)
(define-key cscope-list-entry-keymap "k" 'nil)

;; sr-speedbar 查看c代码定义
(require 'sr-speedbar)
(setq speedbar-tag-hierarchy-method nil)

;; (defun sb-expand-curren-file ()
;;   "Expand current file in speedbar buffer"
;;   (interactive)
;;   (setq current-file (buffer-file-name))
;;   (sr-speedbar-refresh)
;;   (switch-to-buffer-other-frame "*SPEEDBAR*")
;;   (speedbar-find-selected-file current-file)
;;   (speedbar-expand-line))
;;   ;;(speedbar-position-tag-from-defun)

;; (add-hook 'speedbar-visiting-file-hook 'sb-expand-curren-file t)
;; (add-hook 'speedbar-visiting-tag-hook 'sb-expand-curren-file t)

(defun select-next-window ()
  (other-window 1))

(add-hook 'speedbar-visiting-file-hook 'select-next-window t)
(add-hook 'speedbar-visiting-tag-hook 'select-next-window t)

(global-set-key (kbd "<f5>") 'sr-speedbar-toggle)

;which-key
(require 'which-key)
(which-key-mode)

;asciidoc
(require 'adoc-mode)
(add-to-list 'auto-mode-alist (cons "\\.adoc\\'" 'adoc-mode))

;blink
(blink-cursor-mode -1)

;; 去掉菜单栏
(tool-bar-mode -1)
(menu-bar-mode -1)

;; 关闭自动保存
(setq auto-save-default nil)
(setq make-backup-files nil)

;; 过长文件下一行显示
(setq truncate-lines nil)

;; 平滑滚屏
;;(require 'smooth-scrolling)
;;(smooth-scrolling-mode 1)
;(setq smooth-scroll-margin 2)

; org-mode
(setq org-export-with-sub-superscripts (quote {}))
(setq org-export-preserve-breaks t)
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
(add-hook 'org-mode-hook
    (lambda () (auto-complete-mode 1)))
(setq org-log-done t)
(setq org-todo-keywords
  '((sequence "TODO" "FEEDBACK" "|" "DONE" "DELEGATED")))

(add-hook 'org-mode-hook
    (lambda () (define-key evil-motion-state-map (kbd "TAB") 'org-cycle)))
;;(define-key evil-motion-state-map (kbd "TAB") 'org-cycle)

;; 设置字体
(if (eq system-type 'gnu/linux)
    (set-default-font "Mono 13")
    )

(if (eq system-type 'darwin)
    (set-default-font "Monaco 16")
 )

;; 设置时间24小时
(setq display-time-24hr-format t)

;; 自动对齐
(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode 'set-newline-and-indent)

;; 默认tab长度
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil)

;; c-mode 格式
(defun set-my-c-mode ()
  (setq c-default-style "linux"
        c-basic-offset 4
        ;;indent-tabs-mode t
        tab-width 4)
  )
(add-hook 'c-mode 'set-my-c-mode)
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode nil)))

;; 窗口最大化
(if (not (eq window-system 'nil))
    (toggle-frame-maximized)
)

;; projectile
(projectile-global-mode)

; bing词典
(require 'bing-dict)
(global-set-key (kbd "C-c d") 'bing-dict-brief)
(global-set-key (kbd "<f12>") 'bing-dict-brief)

; 透明背景(mac有用，centos上没用, ubuntu 下有用)
(if (eq system-type 'darwin)
    (set-frame-parameter (selected-frame) 'alpha '(80 100))
)
(if (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(alpha 80 100))
)

;; linux 背景
(if (eq system-type 'gnu/linux)
    (set-frame-parameter (selected-frame) 'alpha '(90 100))
)
(if (eq system-type 'gnu/linux)
  (add-to-list 'default-frame-alist '(alpha 90 100))
)

; 编码方式
(prefer-coding-system 'gb2312)
(prefer-coding-system 'utf-8)

;; 自动折叠if语句
(add-hook 'c-mode-hook
          (lambda ()
            (setq hide-ifdef-shadow t)
            (hide-ifdef-mode)
            (hide-ifdefs)))
(setq hide-ifdef-initially t)

;; 语法检查包含头文件
;;(add-hook 'after-init-hook #'global-flycheck-mode)
;;(setq flycheck-clang-args "-isystem")

;; 缩小放大窗口
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-C-<up>") 'enlarge-window)
(global-set-key (kbd "M-C-<down>") 'shrink-window)

;; mac 下 option 作为 meta 键
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'nil)

(if (eq system-type 'gnu/linux)
    (global-unset-key (kbd "C-SPC")))

;; anzu
(global-anzu-mode 1)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

;; highlight paren
(require 'highlight-parentheses)
(add-hook 'c-mode-hook 'highlight-parentheses-mode)

;; highlight symbol
(global-set-key (kbd "\C-x w .") 'highlight-symbol-at-point)

;; hightlight symbol
(require 'highlight-symbol)
(add-hook 'c-mode-hook 'highlight-symbol-mode)
;; (setq highlight-symbol-disable '())
;; (add-hook 'after-change-major-mode-hook
;;           (lambda ()
;;             (if (null (memql major-mode highlight-symbol-disable))
;;                 (highlight-symbol-mode))))

;; html mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-hook 'web-mode-hook 'hs-minor-mode)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-code-indent-offset 4)  
  (setq web-mode-block-padding 0)
  (setq web-mode-css-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;; xclip
(xclip-mode 1)

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
