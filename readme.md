Chicken UUID
============

A native Chicken Scheme implementation for generating UUIDs.

Installation
------------

Use chicken-install and the egg repository.

    chicken-install uuid

Example Use
-----------

    (use uuid)

    ;; Generate a UUID based on (extras random)
    (define decent-uuid (uuid-v4))

    ;; Generate a UUID based on other random number generator
    (define (worse-random n) 1)
    (define worse-uuid (uuid-v4 worse-random))

    ;; Get a list of UUIDs
    (use srfi-1)
    (define uuids (list-tabulate 5 (lambda (_) (uuid-v4))))