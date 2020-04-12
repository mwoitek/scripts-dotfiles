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
;;
(package-initialize)
(custom-set-variables
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(case-fold-search nil)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(custom-safe-themes
   (quote
    ("dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" default)))
 '(display-line-numbers-type (quote relative))
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(line-number-mode nil)
 '(package-selected-packages (quote (sml-mode abyss-theme)))
 '(save-place nil nil (saveplace))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top))
 '(tooltip-mode nil))
(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 150 :width normal)))))
;; Abre o emacs sem mostrar a mensagem de inicialização:
(setq inhibit-startup-message t)
;; Abre o emacs maximizado:
(toggle-frame-maximized)
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
;; Habilita os comandos C-x C-l e C-x C-u para alterar a caixa das letras:
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; Dá acesso aos pacotes do MELPA:
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
