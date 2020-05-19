;;
;;
;;
;; ██╗    ██╗ ██████╗ ██╗████████╗███████╗██╗  ██╗
;; ██║    ██║██╔═══██╗██║╚══██╔══╝██╔════╝██║ ██╔╝
;; ██║ █╗ ██║██║   ██║██║   ██║   █████╗  █████╔╝
;; ██║███╗██║██║   ██║██║   ██║   ██╔══╝  ██╔═██╗
;; ╚███╔███╔╝╚██████╔╝██║   ██║   ███████╗██║  ██╗
;;  ╚══╝╚══╝  ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
;;
;;
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;;
;;
;; Meu arquivo de configuração do emacs.
(package-initialize)
(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(case-fold-search nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("5f27195e3f4b85ac50c1e2fac080f0dd6535440891c54fcfa62cdcefedf56b1b" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" default)))
 '(display-line-numbers-type (quote relative))
 '(display-time-mode t)
 '(evil-auto-indent nil)
 '(evil-ex-search-persistent-highlight nil)
 '(global-auto-complete-mode t)
 '(global-display-line-numbers-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(line-number-mode nil)
 '(package-selected-packages (quote (evil sml-mode)))
 '(save-place nil nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(standard-indent 2)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top))
 '(tooltip-mode nil))
(custom-set-faces
 '(default ((t (:family "BlexMono Nerd Font Mono" :foundry "IBM " :slant normal :weight semi-bold :height 143 :width normal)))))
;; Abre o emacs sem mostrar a mensagem de inicialização:
(setq inhibit-startup-message t)
;; Define o tamanho e a posição da janela do emacs:
(when window-system (set-frame-size (selected-frame) 100 27))
(when window-system (set-frame-position (selected-frame) 230 0))
;; Abre os arquivos .m no octave-mode:
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
;; Desabilita o salvamento automático:
(setq auto-save-default nil)
;; Desabilita o backup:
(setq backup-inhibited t)
;; Quando um arquivo é salvo, remove os espaços desnecessários:
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Fecha certos delimitadores automaticamente:
(electric-pair-mode 1)
;; Dá acesso aos pacotes do MELPA:
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
;; Habilita o evil-mode:
(require 'evil)
(evil-mode 1)
;; Habilita o evil-commentary:
(require 'evil-commentary)
(evil-commentary-mode)
;; Habilita o evil-surround:
(require 'evil-surround)
(global-evil-surround-mode 1)
