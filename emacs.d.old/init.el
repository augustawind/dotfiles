;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package stuff

(package-initialize)

;; cask and pallet
(require 'cask "/usr/local/Cellar/cask/0.8.1/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (zenburn-theme auto-complete evil-tabs solarized-theme haskell-mode evil-visual-mark-mode pallet)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; modes

(load-theme 'zenburn t)

(require 'auto-complete)
(auto-complete-mode)
(ac-config-default)

(require 'evil)
(evil-mode 1)

(require' evil-tabs)
(global-evil-tabs-mode t)

(require 'flycheck)

(require 'flycheck-tip)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings

;; line numbers
(global-linum-mode t)

;; navigate splits with shift-arrowkeys
(windmove-default-keybindings)

;; show column number
(setq column-number-mode t)

;; autopair brackets, parens, etc.
(electric-pair-mode)

;; reload last session on startup
(desktop-save-mode 1)
(setq desktop-save t)

;; safe, clean backup files
(setq backup-directory-alist `(("." . "~/.emacs-saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; erlang

;; erlang-mode
(setq load-path (cons "~/erlang/19.0/lib/tools-2.8.4/emacs" load-path))
(require 'erlang-start)
(setq erlang-root-dir "~/erlang/19.0/")
(setq exec-path (cons "~/erlang/19.0/bin" exec-path))
(setq erlang-man-root-dir "~/erlang/19.0/man")

;; IDE backend
(push "~/.emacs.d/distel/elisp/" load-path)
(require 'distel)
(distel-setup)

; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
	"emacs@"
	(car (split-string (shell-command-to-string "hostname"))))))

;; autocomplete
(push "~/.emacs.d/distel-completion" load-path)
(require 'auto-complete-distel)
(add-to-list 'ac-sources 'auto-complete-distel)

;; linter
(flycheck-define-checker
    erlang-otp
    "An Erlang syntax checker using the Erlang interpreter."

    :modes (erlang-mode)

    :command ("erlc" "-o" temporary-directory "-Wall"
	      "-I" "../include" "-I" "../../include"
              "-I" "../../../include" source)

    :error-patterns ((warning line-start (file-name)
			      ":" line ": Warning:" (message) line-end)
		     (error line-start (file-name)
			    ":" line ": " (message) line-end)))

(add-hook 'erlang-mode-hook
          (lambda ()
            (flycheck-select-checker 'erlang-otp)
                        (flycheck-mode)))

