#lang racket/base

(require (only-in racket/list
                  last)
         (only-in racket/function
                  curry)
         (only-in racket/path
                  path-has-extension?)
         racket/cmdline)


(define (explode-path/with-empty path)
  (if (equal? path 'same)
      '() (explode-path path)))

;; produce the line of text in markdown formatting
;; of path, as it would appear in a directory tree list
;; with links, eg.  "    - [foo.txt](/home/charlie/foo.txt)"
(define (md-list-line path)
  (define exploded-path (explode-path/with-empty path))
  (cond
    [(null? exploded-path) ""]
    [else
     (define link-location (path->string path))
     (define link-text (path->string (last exploded-path)))
     (define indent
       (make-string (* (sub1 (length exploded-path)) 4) #\space))
     (format "~a- [~a](~a)"
             indent link-text link-location)]))

;; predicate to check if the path has any one of the
;; file extensions in ext
(define (path-has-extension?* path exts)
  (ormap (curry path-has-extension? path) exts))

(module+ main
  (define title (make-parameter #f))
  (define whitelist (make-parameter null))
  (define dir
    (command-line
     #:once-each
     [("-T" "--title") title-text "Title" (title title-text)]
     #:multi
     [("-w" "--whitelist") file-ext "File extension (with dot)"
                           (whitelist (cons file-ext (whitelist)))]

     #:help-labels "An optional whitelist of file extensions restricts
     the tree to files having those extensions, and directories."
     #:args ([dir "."])
     dir))
  (when (title)
    (printf "# ~a\n\n" (title)))
  (parameterize ([current-directory dir])
    (for ([path (in-directory)])
      (when (or (null? (whitelist))
                (directory-exists? path)
                (path-has-extension?* path (whitelist)))
        (displayln (md-list-line path))))))
