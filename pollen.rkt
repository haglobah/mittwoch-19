#lang racket

(require pollen/core)

(provide (all-defined-out))

(define (braced #:href href . elems)
  `(a ([class "flex justify-center gap-2 text-4xl md:text-5xl font-bold"] [href ,href])
      (span "{")
      (span ,@elems)
      (span "}")))

(define (sec #:title title . elems)
  `(div ([id ,title] [class "my-8 mx-6"])
      (h2 ([class "text-4xl md:text-5xl font-mono text-thulian"])
          ,title)
      ,@elems))

(define (par . elems)
  `(p ([class "text-lg my-2"])
    ,@elems))
