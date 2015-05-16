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
          var idcomments_post_id;
          var idcomments_post_url;
        </script>
        <span id="IDCommentsPostTitle" style="display:none"></span>
        <script type='text/javascript' src='http://www.intensedebate.com/js/genericCommentWrapperV2.js'></script>
        })

(define (render-mathjax-shortcut)
  @list{<div id="mathjax-shortcut">
        <a href="javascript:(function(){function e(e){var t='.MathJax .mn {background: inherit;} .MathJax .mi {color: inherit;} .MathJax .mo {background: inherit;}';var a=e.createElement('style');a.innerText=t;try{a.textContent=t}catch(n){}e.getElementsByTagName('body')[0].appendChild(a);var i=e.createElement('script'),o;i.src='//cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_HTMLorMML.js';i.type='text/javascript';o='MathJax.Hub.Config({tex2jax:{displayMath:[[\'\\\\[\',\'\\\\]\']]}});MathJax.Hub.Startup.onload();';if(window.opera)i.innerHTML=o;else i.text=o;e.getElementsByTagName('head')[0].appendChild(i)}function t(t){if(t.MathJax===undefined){e(t.document)}else{t.MathJax.Hub.Queue(new t.Array('Typeset',t.MathJax.Hub))}}var a=document.getElementsByTagName('iframe'),n,i;t(window);for(n=0;n<a.length;n++){i=a[n].contentWindow||a[n].contentDocument;if(!i.document)i=i.parentNode;t(i)}})();">LaTeX-ify this page</a></div>})