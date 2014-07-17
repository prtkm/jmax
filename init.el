;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;; remember this directory
(defconst starter-kit-dir (file-name-directory (or load-file-name (buffer-file-name)))
    "directory where the starterkit is installed")

(defvar user-dir (expand-file-name "user" starter-kit-dir)
  "user directory for personal code")

(add-to-list 'load-path starter-kit-dir)
(add-to-list 'load-path user-dir)

;; check status of jmax, and update if needed. We use a timeout of 10
;; seconds which defaults to no update. 
(shell-command "git fetch")
(unless (= 0 (string-to-number
	      (shell-command-to-string
	       "git rev-list HEAD...origin/master --count")))
  (when (y-or-n-p-with-timeout "jmax is not up to date. Update now?" 10 nil)
    (message "updating jmax now")
    (shell-command "git pull")))

(require 'packages)
(require 'jmax)
;;; end init

