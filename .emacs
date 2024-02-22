
;; basic settings.

(setq display-warning-minimum-level :error)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default c-basic-offset 4)
(set-default 'truncate-lines t)
(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(c-set-offset 'case-label '+)

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

(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q") 'execute-extended-command)

(global-set-key (kbd "C-c C-v") 'eshell)

;; Additional gtags commands when required

; Add the dir path where gtags.el is stored to the load path.
; (add-to-list 'load-path "~/foo/bar/")

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
;; (when load-file-name
;;   (setq user-emacs-directory (file-name-directory load-file-name)))
;; (add-to-list 'load-path "~/.emacs.d")
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (ac-config-default)
