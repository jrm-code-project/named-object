;;; -*- Lisp -*-

(defpackage "NAMED-OBJECT"
  (:use "COMMON-LISP")
  (:export "GET-NAME"
           "NAMED-OBJECT"))

(in-package "NAMED-OBJECT")

(defgeneric get-name (object))

(defclass named-object ()
  ((name :initarg :name
         :initform (error "Required initarg :name omitted.")
         :reader get-name
         :type string)))

(defmethod make-instance ((class (eql (find-class 'named-object))) &rest initargs)
  (declare (ignore initargs))
  (error "Cannot instantiate mixin class ~s." class))

(defmethod print-object ((obj named-object) stream)
  (print-unreadable-object (obj stream :identity t :type t)
    (format stream "~a" (slot-value obj 'name))))
