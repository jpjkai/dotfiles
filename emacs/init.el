(require 'package)
;; Add the original Emacs Lisp Package Archive
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
;; Add melpa
             '("melpa" . "https://melpa.org/packages/")
;; Add the user-contributed repository
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; start emacsclient
(server-start)

(add-to-list 'load-path "~/.emacs.d/plugins")

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

(require 'xcscope)
(cscope-setup)

(global-linum-mode 1)
(setq linum-format "%d ")
;; (add-to-list 'load-path "~/.emacs.d/plugins/helm")
;; (require 'helm-config)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-hook 'after-init-hook '(global-auto-complete-mode 1))
(setq ag-executable "/proj/spr/tools/ag-1.24/bin/ag")
(setq ag-highlight-search t)
(setq ag-reuse-buffers t)

;;;==============================================================================
;;; Key bindings
;;;==============================================================================
;; Misc shortcuts
(global-set-key (kbd "M-g")                  'goto-line)
;;(global-set-key (kbd "C-z")                  'undo)
;(global-set-key [C-tab]                      'other-window)
(global-set-key [(control next)]             'other-window)
(global-set-key [(backtab)]                  'indent-region)
(global-set-key [(backspace)]                'delete-backward-char)
(global-set-key [(delete)]                   'delete-char)
(global-set-key [(control backspace)]        'backward-kill-word)
(global-set-key [(control delete)]           'kill-word)
(global-set-key (kbd "<f1>")                 'cd)
(global-set-key (kbd "<f2>")                 'ansi-term)
(global-set-key (kbd "<f3>")                 'ag)
(global-set-key (kbd "<f4>")                 'occur)
(global-set-key (kbd "<f5>")                 'revert-buffer)
(global-set-key (kbd "<f6>")                 'dired)
(global-set-key (kbd "<f7>")                 'next-buffer)
(global-set-key (kbd "<f8>")                 'previous-buffer)
(global-set-key (kbd "<f9>")                 'compile)
(global-set-key (kbd "<f10>")                'first-error)
(global-set-key (kbd "<f11>")                'previous-error)
(global-set-key (kbd "<f12>")                'next-error)
(global-set-key [(control f3)]               'highlight-symbol)
(global-set-key [(control f5)]               'magit-status)
(global-set-key [(control f6)]               'magit-blame-mode)
(global-set-key [(control f7)]               'magit-blame-previous-chunk)
(global-set-key [(control f8)]               'magit-blame-next-chunk)
(global-set-key [(control f9)]               'flycheck-buffer)
(global-set-key [(control f10)]              'flycheck-list-errors)
(global-set-key [(control f11)]              'flycheck-previous-error)
(global-set-key [(control f12)]              'flycheck-next-error)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-buffer-maximum-size 20000)
 '(comint-input-ignoredups t)
 '(comint-input-ring-size 5000)
 '(comint-scroll-show-maximum-output t)
 '(custom-safe-themes
   (quote
    ("b0984818158ff2fa3ae511a2f3db7ea239a223d1dc09475c6c2ccdbc8ee03dd3" "d9046dcd38624dbe0eb84605e77d165e24fdfca3a40c3b13f504728bab0bf99d" default)))
 '(inhibit-startup-screen t)
 '(magit-auto-revert-mode nil)
 '(package-selected-packages
   (quote
    (virtualenv nlinum magit light-symbol jedi flycheck-color-mode-line exec-path-from-shell elpy dash-functional company-c-headers auto-virtualenv anzu anaconda-mode ag ac-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
 '(which-func ((t (:foreground "yellow")))))

;; (setq-default compile-command "" )

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<f6>") 'rename-buffer)
(setq ibuffer-display-summary nil)

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 50 30 :left :elide)
              " "
              filename-and-process)))

(global-set-key (kbd "M-i") 'imenu)

;; Normalize undo behaviour in putty and x
(global-set-key (kbd "C-/") 'undo)

(global-set-key (kbd "C-c C-v") 'ff-find-other-file)

(global-set-key (kbd "M-|") 'pop-tag-mark)

;; Query replace regexp (default , \(\w+\)) {$ -> _\1) {)
;; Change _aga to aga_: Query replace regexp (default \([^a-z]\)_\([a-zA-Z0-9_]*\) -> \1\2_):

;; syntax highlighting for make files
(add-to-list 'auto-mode-alist '("\\.platform$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("Makefile\\..*" . makefile-gmake-mode))

(add-to-list 'auto-mode-alist '("\\.bb$" . sh-mode))

(add-to-list 'auto-mode-alist '(".aliases" . sh-mode))

;; Use bash in emacs shells
;;(setenv "ESHELL" (expand-file-name "~/eshell"))
;; OR
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
;; Don't lose any output
(setq term-buffer-maximum-size 250000)
;; Enable tput in compilation buffer
(setq compilation-environment '("TERM=xterm"))

;; Scroll compilation window automatically and stop on first error
;; Can be nil, non-nil (to always scroll to the bottom), or first-error
(setq compilation-scroll-output 'first-error)

(setq scroll-step 1)


;; ===== Turn off tab character =====
(setq-default indent-tabs-mode nil)

;; ========== Support Wheel Mouse Scrolling ==========
;; (mouse-wheel-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq column-number-mode t)

(setq-default tab-width 4)

(defun my-c++-mode-hook ()
  (setq c-default-style "linux"
        c-basic-offset 4)
  (c-set-offset 'inline-open '0))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c++-mode-hook)
(add-hook 'java-mode-hook 'my-c++-mode-hook)


;; Subword mode for C
(add-hook 'c-mode-common-hook
          (lambda () (subword-mode 1)))

(setq-default fill-column 80)

;; Remove wordwrap in nowindow
;; (set-display-table-slot standard-display-table 'wrap ?\ )

;; Notepad++-style word wrapping
;;(global-visual-line-mode t)

;; set background to pale tinge

(setq initial-frame-alist '((width . 100) (height . 54)))
(setq default-frame-alist
      '((menu-bar-lines . 1)
        (left-fringe)
        (right-fringe)
        (tool-bar-lines . 0)
        (width . 100)
        (height . 52)
        ))

(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)

(require 'whitespace)
(setq whitespace-line-column 100) ;; limit line length
(setq whitespace-style '(face lines-tail trailing tabs))

(defun whitespace-post-command-hook() nil)

(add-hook 'c-mode-hook
          (function (lambda ()
                      (whitespace-mode t))))

(add-hook 'c++-mode-hook
  (function (lambda ()
              (whitespace-mode t))))

(add-hook 'java-mode-hook
  (function (lambda ()
              (whitespace-mode t))))

(add-hook 'python-mode-hook
  (function (lambda ()
              (whitespace-mode t))))

(add-hook 'sh-mode-hook
  (function (lambda ()
              (whitespace-mode t))))

(add-hook 'emacs-lisp-mode-hook
  (function (lambda ()
              (whitespace-mode t))))


(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; (setq magit-last-seen-setup-instructions "1.4.0")
;; (setq magit-auto-revert-mode nil)
;; (eval-after-load 'magit
;;   '(progn
;;      (set-face-foreground 'magit-diff-add "green3")
;;      (set-face-foreground 'magit-diff-del "red3")
;;      (unless window-system
;;        (set-face-background 'magit-item-highlight "white"))))

(global-set-key (kbd "M-s") 'magit-status)

(setq mouse-yank-at-point t)

;; Add anzu-mode so C-s shows number of occurances
(global-anzu-mode +1)

(tool-bar-mode -1)
(menu-bar-mode -1)

;; http://stackoverflow.com/a/3072831
;; (require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; Fix broken output in ansi-term
;; http://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode
(set-terminal-coding-system 'utf-8-unix)

(savehist-mode 1)

;; higlight symbol occurrses when cursor is on-top
(light-symbol-mode t)

;; turn on automatic bracket insertion by pairs. New in emacs 24
(electric-pair-mode 1)

;; Display tabs and trailing spaces
(global-whitespace-mode t)
(setq-default whitespace-style '(face tab trailing))

;; Highlight matching parentheses
(show-paren-mode t)

;; show the current function
;; customize color with M-x list-faces-display
(which-function-mode t)

;; y-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; define jump to parenthesis with %
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(global-set-key (kbd "C-%") 'goto-mach-paren)


(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) ) ;M-k kills to the left

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; set ido-mode
(ido-mode t)

;; Remove trailing whitespace when the file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Lib-files
(add-to-list 'auto-mode-alist '("\\.ddl$" . c-mode))

(add-to-list 'backup-directory-alist
                          (cons "." "~/.emacs.d/backups/"))
(setq tramp-backup-directory-alist backup-directory-alist)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'misterioso t)

;; Approximation of Ericsson C-style
(defun my-c-mode-common-hook ()
  (c-set-style "linux")
                                        ; (c-set-offset 'case-label '+)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq tab-width 4)
  (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
  ;; Set the indentation according to context
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  ;; Show useless whitespace
  (setq show-trailing-whitespace t)
  ;; Remove all whitespace around the cursor when DEL or BACKSPACE is hit
  (c-toggle-hungry-state t)
  ;; Autocomplete
  (abbrev-mode 1)
  (auto-complete-mode t)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
;; Never ever use tabs in code
(setq-default indent-tabs-mode nil)
;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Lib-files
(add-to-list 'auto-mode-alist '("\\.ddl$" . c-mode))

(require 'cl)
(autoload 'yang-mode "yang-mode" "Major mode for editing YANG models." t)
(add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))
