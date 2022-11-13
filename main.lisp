(require 'asdf)
(ql:quickload :ltk)

(defpackage :app (:use :cl))
(in-package :app)

(defun hiFunc     (label)  (lambda () (setf (ltk::text label) "Hi")))
(defun helloFunc  (label)  (lambda () (setf (ltk::text label) "Hello")))

(defun fullquit ()
  #+sbcl (sb-ext:quit)
  #+clisp (ext:exit)
  #+ccl (ccl:quit)
  #+allegro (excl:exit))

(defun main()
  (ltk::with-ltk ()
   (let* (
    (main-frame   (ltk::make-instance 'ltk::frame))
    (main-label   (ltk::make-instance 'ltk::label  :master main-frame :text "Welcome"))
    (button-one   (ltk::make-instance 'ltk::button :master main-frame :text "Hello"    :command (helloFunc main-label)))
    (button-two   (ltk::make-instance 'ltk::button :master main-frame :text "Hi There" :command (hiFunc main-label) ))
    (button-three (ltk::make-instance 'ltk::button :master main-frame :text "exit"     :command #'fullquit ))
    )
    
    (ltk::pack main-frame  )
    (ltk::pack main-label  )
    (ltk::pack button-one  )
    (ltk::pack button-two  )
    (ltk::pack button-three)
    
    )))

(main)