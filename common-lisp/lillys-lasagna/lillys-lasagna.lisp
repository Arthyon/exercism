(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven () "Returns expected time in oven"
  337)

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (minutes) "Calculates remaining minutes in oven"
  (- (expected-time-in-oven) minutes))

;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers) "Calculates preparation time in minutes"
  (* layers 19))

;; Define function elapsed-time-in-minutes
(defun elapsed-time-in-minutes (layers minutes) "Calculates elapsed time in minutes"
  (+ minutes (preparation-time-in-minutes layers)))
