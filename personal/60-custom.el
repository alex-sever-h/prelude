(prelude-require-packages '(iedit ecb vlf ag))

(cua-mode 1)

(setq ecb-layout-name "left7")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 5)
(setq ecb-windows-width 35)

(require 'iedit)
(defun quit-iedit-mode ()
  "Turn off iedit-mode."
  (interactive)
  (iedit-mode -1))
(define-key iedit-mode-keymap (kbd "RET") 'quit-iedit-mode)

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "C-;") 'iedit-mode)
(define-key my-keys-minor-mode-map (kbd "<f3>") 'semantic-ia-fast-jump)
(define-key my-keys-minor-mode-map (kbd "<f5>") 'revert-buffer)
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)

;; Work-around for high DPI
(scroll-bar-mode -1)

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

(line-number-mode 1)

; This is to override prelude behaviour of C-left C-right
(custom-set-variables
 '(sp-override-key-bindings (quote (("C-<right>") ("C-<left>")))))
