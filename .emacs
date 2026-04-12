;; basic settings.
(setq ediff-diff-options "-w")
(setq initial-major-mode 'text-mode)
(setq scroll-step 1)

(setq display-warning-minimum-level :error)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default c-basic-offset 4)
(set-default 'truncate-lines t)
(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(c-set-offset 'case-label '+)
(when (not (window-system))
  (menu-bar-mode -1))

(global-set-key (kbd "C-h") 'delete-backward-char)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)

(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-j") 'backward-word)

(global-unset-key (kbd "C-w"))
(global-set-key (kbd "C-w") 'other-window)

(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") 'scroll-down-command)

(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o C-o") 'delete-other-windows)
(global-set-key (kbd "C-o C-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "C-o C-p") (lambda ()
				  (interactive)
				  (split-window-horizontally)
				  (other-window 1)))
(global-set-key (kbd "C-o C-l") (lambda ()
				  (interactive)
				  (split-window-vertically)
				  (other-window 1)))

(global-unset-key (kbd "C-l"))
(global-set-key (kbd "C-l C-h") 'highlight-symbol-at-point)
(global-set-key (kbd "C-l C-g") 'goto-line)
(global-set-key (kbd "C-l C-l") 'copy-region-as-kill)
(global-set-key (kbd "C-l C-w") 'previous-buffer)
(global-set-key (kbd "C-l C-k") 'kill-emacs)
(global-set-key (kbd "C-l C-q") 'query-replace)

(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q") 'execute-extended-command)

(global-set-key (kbd "C-c C-v") 'eshell)

;; Additional gtags commands when required

; Add the dir path where gtags.el is stored to the load path.
; (add-to-list 'load-path "~/foo/bar")
; (require 'gtags)
; (global-set-key (kbd "C-l C-d") 'gtags-find-tag)
; (global-set-key (kbd "C-l C-r") 'gtags-find-rtag)
; (global-set-key (kbd "C-l C-s") 'gtags-find-symbol)
; (global-set-key (kbd "C-l C-p") 'gtags-pop-stack)

;; org-mode
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-j") 'backward-word))
(put 'downcase-region 'disabled nil)

;; Notes about auto-complete installation :
;;
;; Refer to 'Manual Installation' in https://auto-complete.github.io/doc/manual.html#installation
;;
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path "~/.emacs.d")

(require 'avy)
(global-set-key (kbd "C-l C-c") 'avy-goto-char)

(require 'swiper)
(global-set-key (kbd "C-l C-s") 'swiper)

(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

;; (ivy-mode 1)
;; (counsel-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(avy bison-mode company company-jedi counsel eldoc helm magit
	 web-mode yaml-mode yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-emacs)

(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(require 'yasnippet)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "C-l i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-l n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-l v") 'yas-visit-snippet-file)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
