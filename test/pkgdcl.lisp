;;;; -*- indent-tabs-mode: nil -*-

(defpackage :bordeaux-threads-2/test
  (:use :common-lisp :alexandria :bordeaux-threads-2 :fiveam)
  (:import-from :bordeaux-threads-2
                #:mark-not-implemented #:*not-implemented*
                #:implemented-p #:implemented-p*)
  (:shadow #:is))

(in-package :bordeaux-threads-2/test)

(def-suite :bordeaux-threads-2)

(def-fixture using-lock ()
  (let ((lock (make-lock)))
    (&body)))

(defmacro is (test &rest reason-args)
  (with-gensyms (c)
    `(handler-case
         (5am:is ,test ,@reason-args)
       ((or bt2::operation-not-implemented
         bt2::keyarg-not-implemented) (,c)
         (declare (ignore ,c))
         (5am:skip "Skipping operations that are not implemented")))))
