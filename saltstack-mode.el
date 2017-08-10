;;; salt-mode.el --- SaltStack language mode
;;; Copyright (C) 2017 Massachusetts Institute of Technology
;;; Author: Tobias Macey
;;; Code:
;;; Commentary:
(defconst saltstack-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?\{ "(} 1b" table)
    (modify-syntax-entry ?\} "){ 4b" table)
    (modify-syntax-entry ?% "$" table)
    (modify-syntax-entry ?# "<> 23" table)
    (modify-syntax-entry ?\n ">" table)
    table))

(defconst saltstack-fontlock-keywords
      `(
        ("^\\([\\[:word:]\\[:digit:]][\\[:word:]\\[:digit:]-_ 	]*\\):$" 1 font-lock-constant-face)
        ("^\\s-+\\([\\[:word:]]+\\).\\([\\[:word:]]+\\):$"
         (1 font-lock-builtin-face)
         (2 font-lock-function-name-face))
        )
      )

(defvar salt-mode-hook nil)

(defvar salt-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map))

(define-derived-mode saltstack-mode prog-mode "SaltStack"
  :syntax-table saltstack-mode-syntax-table
  (setq font-lock-defaults '(saltstack-fontlock-keywords)))

(add-to-list 'auto-mode-alist '("\\.sls\\'" . salt-mode))

(provide 'saltstack-mode)
;;; salt-mode.el ends here
