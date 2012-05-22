;;; WL-NIFTY4U-PLUS.EL --- A Package for linking Nifty4U+ with Wanderlust.

;; Copyright (C) 2000 KUNISHIMA Takeo

;; Author: KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
;; Maintainer: KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
;; Created: 02 Jan 2000
;; Version: 1.0
;; Keywords:

 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 1, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; A copy of the GNU General Public License can be obtained from this
;; program's author (send electronic mail to <kunishi@c.oka-pu.ac.jp>)
;; or from the Free Software Foundation, Inc., 675 Mass Ave,
;; Cambridge, MA 02139, USA.

;; LCD Archive Entry:
;; wl-nifty4u-plus|KUNISHIMA Takeo|<kunishi@c.oka-pu.ac.jp>
;; |A Package for linking Nifty4U+ with Wanderlust.
;; |$Date: 2000/01/09 02:48:57 $|$Revision: 1.4 $|~/packages/wl-nifty4u-plus.el

;;; Commentary:
;;;
;;; $Id: wl-nifty4u-plus.el,v 1.4 2000/01/09 02:48:57 kunishi Exp $

;;; Code:

(require 'wl-draft)

(defvar wl-nifty4u-mail-spool-directory "~/var/spool/nifty4u/mail.going/"
  "Mail spool directory for Nifty4U+.")
(defvar wl-nifty4u-news-spool-directory "~/var/spool/nifty4u/nifty.going/"
  "News spool directory for Nifty4U+.")

(defun wl-draft-send-mail-with-nifty4u-plus ()
  "Pass the prepared mail message buffer to Nifty4U+ spool directory."
  (let ((random-num (random 999))
        spooled-file)
    (while (file-exists-p
	    (setq spooled-file (expand-file-name
				(concat wl-nifty4u-mail-spool-directory
					"D.niftyB" random-num))))
      (setq random-num 999))
    (write-file spooled-file)
    (wl-draft-set-sent-message 'mail 'sent)))

(defun wl-draft-send-news-with-nifty4u-plus ()
  "Pass the prepared message buffer to Nifty4U+ spool directory."
  (let ((time (format-time-string "%s"))
	(random-num (random 65536))
	spooled-file)
    (while (file-exists-p 
	    (setq spooled-file (expand-file-name
				(concat wl-nifty4u-news-spool-directory
					time "." random-num))))
      (setq random-num (random 65536)))
    (write-file spooled-file)
    (wl-draft-set-sent-message 'news 'sent)))

(provide 'wl-nifty4u-plus)

;;; WL-NIFTY4U-PLUS.EL ends here
