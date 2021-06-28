;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Here are some additional functions/macros that could help you configure Doom:
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(setq user-full-name "Marcio Woitek"
      user-mail-address "woitek@usp.br")

(setq doom-font (font-spec :family "FiraMono Nerd Font Mono" :size 17 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "FiraMono Nerd Font" :size 17))

;; (setq doom-theme 'doom-monokai-pro)
(setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-one)

(setq org-directory "~/repos/org/")

(setq display-line-numbers-type 'visual)

;; When documents are saved, delete trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; In ess-r-mode, indent using 2 spaces
(add-hook 'ess-r-mode-hook '(lambda () (setq evil-shift-width 2)))

;; For lsp-mode, disable symbol highlighting
;; (setq lsp-enable-symbol-highlighting nil)

;; In org-mode, add timestamp when task is marked as DONE
(setq org-log-done 'time)

;; (after! ispell
;;   (setq ispell-dictionary "pt_BR,en_US")
;;   (ispell-set-spellchecker-params)
;;   (ispell-hunspell-add-multi-dic "pt_BR,en_US")
;;   (setq ispell-personal-dictionary "~/.hunspell_personal"))

(require 'evil-replace-with-register)
(setq evil-replace-with-register-key (kbd "gr"))
(evil-replace-with-register-install)
