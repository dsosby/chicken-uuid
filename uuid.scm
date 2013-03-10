;; Module for generation of UUIDs

(module uuid
	(export uuid-v4)
	(import scheme chicken)

(use extras srfi-13)

(define hex-vals (string->list "0123456789abcdef"))
(define uuid-v4-pattern "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx")

;; Returns an RFC 4122, section 4.4 compliant
;; uuid based on either the default random
;; function or one supplied with the function
;;
;; Ideas from this thread:
;; http://stackoverflow.com/questions/105034/how-to-create-a-guid-uuid-in-javascript 
(define (uuid-v4 #!optional [randfn random])
  (letrec ([x-replace (lambda () (list-ref hex-vals (randfn 16)))]
	   [y-replace (lambda () (list-ref hex-vals (bitwise-ior (bitwise-and (randfn 16) #x08) #x03)))]
	   [map-proc (lambda (c) (cond ((eq? c #\x) (x-replace)) ((eq? c #\y) (y-replace)) (else c)))])
    (string-map map-proc uuid-v4-pattern)))

)