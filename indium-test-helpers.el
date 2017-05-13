;;; indium-test-helpers.el --- Helpers for running Indium tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2016-2017  Nicolas Petton

;; Author: Nicolas Petton <nicolas@petton.fr>
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides helpers for running Indium tests.

;;; Code:

(defmacro with-js2-buffer (contents &rest body)
  "Evaluate BODY.

BODY is evaluated with the current buffer set to a JavaScript
buffer in `js2-mode' with CONTENTS."
  (declare (indent 1))
  `(with-temp-buffer
     (insert ,contents)
     (goto-char (point-max))
     (js2-mode)
     (js2-parse)
     ,@body))

(defmacro with-indium-connection (connection &rest body)
  "Evaluate BODY with CONNECTION as the indium-connection."
  (declare (indent 1))
  `(let ((indium-connection ,connection))
     ,@body))

(defmacro with-fake-indium-connection (&rest body)
  "Evaluate BODY with an indium connection with a fake backend."
  (declare (indent 0))
  `(with-indium-connection '((backend . fake))
     ,@body))

(provide 'indium-test-helpers)
;;; indium-test-helpers.el ends here
