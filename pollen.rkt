#lang racket

(require pollen/core)

(provide (all-defined-out))

(define (braced #:href href . elems)
  `(a ([class "flex justify-center gap-4 text-3xl md:text-5xl items-center "] [href ,href])
      (span ([class "text-7xl md:text-8xl"]) "{")
      (span ([class "font-bold text-center"]) ,@elems)
      (span ([class "text-7xl md:text-8xl"]) "}")))

(define (sec #:title title . elems)
  `(div ([id ,title] [class "my-8 mx-6"])
      (h2 ([class "text-4xl md:text-5xl font-mono text-thulian"])
          ,title)
      ,@elems))

(define (par . elems)
  `(p ([class "text-lg my-2"])
    ,@elems))

