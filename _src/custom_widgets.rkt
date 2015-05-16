#lang at-exp racket/base

(require racket/string
         racket/function)

(provide (all-defined-out))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; IntenseDebate
;;

(define (intense-debate-comments acct)
  @list{
        <script>
          var idcomments_acct = '@|acct|';
        </script>
        <span id="IDCommentsPostTitle" style="display:none"></span>
        <script type='text/javascript' src='http://www.intensedebate.com/js/genericCommentWrapperV2.js'></script>
        })