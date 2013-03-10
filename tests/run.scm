(use test srfi-1 irregex)

(load-relative "../uuid.scm")
(import uuid)

(define lots-of-uuids (list-tabulate 30 (lambda (_) (uuid-v4))))
(test "No duplicates" (length lots-of-uuids) (length (delete-duplicates lots-of-uuids)))

(define (not-rand _) 1)
(test "Randfn recognized" (uuid-v4 not-rand) (uuid-v4 not-rand))

(test-exit)