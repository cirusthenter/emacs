;; Most important package
;; Activate package.el
(require 'package)
;; Add Marmalade and MELPA to the package repository
(add-to-list 
 'package-archives
 '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
 (package-initialize) ; load installed Elisp

; ADDED BEFORE Mar 13, 2020

;; set font
(set-default-font "Menlo 15")

;; do not show the start up message
(setq inhibit-startup-message t)

;; set a tab to 4 spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; show line number
(global-linum-mode t)

;; show the corresponding brace 
(show-paren-mode 1)

;; turn the bell off
(setq ring-bell-function 'ignore)

;; highlighting the current line
(defface my-hl-line-face
  ;; set it to navyblue when if the default background color is dark
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; auto insert ) or }
(electric-pair-mode 1)

;; Alias of replace-string
(defalias 'rs 'replace-string)
;;A lias of query-replace
(defalias 'qr 'query-replace)
;; Alias of M-x align
(defalias 'a 'align)
;; Alias of goto-line
(defalias 'gl 'goto-line)

;;; Highlight if one line has over 80 chars in C, Python
;; C
(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
;; C++
(add-hook 'c++-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))
;; Python
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
'(("^[^\n]\\{80\\}\\(.*\\)$" 1
  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;;; Highlight if one line has over 100 chars in Java
(add-hook 'java-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{100\\}\\(.*\\)$" 1  '((((class color) (background dark))
     (:background "Gray" t))
    ;; set it to LightSkyBlue if the default background color is light
    (((class color) (background light))
     (:background "LightSkyBlue" t))
    (t (:bold t))))))))

;; setting about auto-complete
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil)
  )


;; setting about color-moccur 
(when (require 'color-moccur nil t)
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  (setq moccur-split-word t)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  )


; ADDED ON Mar 13, 2020
;; theme: wombat
(load-theme 'wombat t)

;; Helm
(require 'helm-config)

;; undohist
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-tree
(when (require 'undo-tree nil t)
(global-undo-tree-mode))

;; cua-mode: Common User Access
(cua-mode t)
; (setq cua-enable-cua-keys nil) 

;; python check
(setq python-check-command "flake8")

;; Flycheck; Grammer Checking package
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

;; set te c-mode indent style to bsd, but the indent offset to 4
;; show if the end of the line has an unnecessary space or tab
(add-hook 'c-mode-common-hook
		  (lambda ()
			(c-set-style "bsd")
			(setq c-basic-offset 4)
			(setq show-trailing-whitespace t)))

(require 'hungry-delete)
(global-hungry-delete-mode)
