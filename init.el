(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

;evil
(require 'evil)
  (evil-mode 1)

;cscope
(require 'xcscope)

;asciidoc
(require 'adoc-mode)

;gtags
;(add-to-list 'load-path "~/.emacs.d")
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
       '(lambda ()
         (gtags-mode 1)))
(gtags-mode 1) ;; 好像不在.emacs中使能gtags-mode下面的函数就找不到。
(define-prefix-command 'yp-gtags-map) ;; 和下一句话合起来定义一个自己的快捷键头（C-xg）。
(global-set-key "\C-xg" 'yp-gtags-map)
(define-key gtags-mode-map "\C-xgv" 'gtags-visit-rootdir)  ;; 选择搜索的根目录。
(define-key gtags-mode-map "\C-xgt" 'gtags-find-tag)  ;; 找函数定义
(define-key gtags-mode-map "\C-xgo" 'gtags-find-tag-other-window)  ;; 打开一个新窗口找函数定义
(define-key gtags-mode-map "\C-xgr" 'gtags-find-rtag)  ;; 找函数的调用
(define-key gtags-mode-map "\C-xgs" 'gtags-find-symbol)  ;; 搜索符号，也就是变量的定义和调用
(define-key gtags-mode-map "\C-xgp" 'gtags-find-pattern)  ;; 似乎和下面两个一样，都是在项目中进行字符串搜索，不知道有啥区别，不会使。
(define-key gtags-mode-map "\C-xgg" 'gtags-find-with-grep)
(define-key gtags-mode-map "\C-xgi" 'gtags-find-with-idutils)
(define-key gtags-mode-map "\C-xgf" 'gtags-find-file)  ;; 在项目中搜索文件。
(define-key gtags-mode-map "\C-xga" 'gtags-parse-file)  ;; 分析指定文件（基本就是找到所有能找到的定义），列在emacs中。
(define-key gtags-mode-map "\C-xg]" 'gtags-find-tag-from-here)  ;;

;blink
(blink-cursor-mode -1)

;vim
;(define-key evil-normal-state-map "C-]" 'gtags-find-tag-from-here)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(send-mail-function nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "文泉驿等宽正黑" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

(setq auto-save-default nil)
(setq make-backup-files nil)
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

(set-default-font "DejaVu Sans Mono 10")
(set-fontset-font "fontset-default" 'unicode"WenQuanYi Bitmap Song 12") ;;for linux
