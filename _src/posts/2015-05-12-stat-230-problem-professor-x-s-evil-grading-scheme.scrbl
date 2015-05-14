#lang scribble/manual

Title: Stat 230 Problem: Professor X's evil grading scheme
Date: 2015-05-12T16:52:54
Tags: stat230, projects

@(require "../pr-math.rkt")
@(require frog/scribble)
@setup-math

@section[#:style 'unnumbered]{}

I found a really interesting problem in my STAT 230 course notes. Problem 2.8 on page 14 involves a cheeky and/or evil professor who decides to play a game with two of his students to determine their respective grades in STAT 230. The game is essentially to guess the professor's number, and to have a better guess than the other person. I found the problem fairly interesting, and although I lacked the theoretical knowledge to be able to solve it and prove that I had found an optimal solution, I knew I could code up a simulation and have fun doing it. @(hyperlink "http://cwang.me/Stats" "Here is what I came up with").

<!-- more -->

@subsection[#:style 'unnumbered]{The problem}

@italic{Anonymous professor X has an integer \((1 \leq m \leq 9)\) in mind and asks two students, Allan and Beth to pick numbers between 1 and 9. Whichever is closer to m gets 90% and the other 80% in STAT 230. If they are equally close, they both get 85%. If the professor’s number and that of Allan are chosen purely at random and Allan announces his number out loud, describe a sample space and a strategy which leads Beth to the highest possible mark.}

@subsection[#:style 'unnumbered]{Strategies}

The simulation repeats the game a few thousand times to determine the expected value of Beth's mark. The question asks for us to find a strategy for picking a number, given Allan's number, that maximizes Beth's mark. Trivially, if Beth only wanted to avoid the worst case, then picking the same number as Allan every time would guarantee this.

One possible strategy is given by

  \[f(n) = \left\{
     \begin{array}{lr}
       n + 1 & : n < 5 \\
       n     & : n = 5 \\
       n - 1 & : n > 5
     \end{array}
  \right.\]

with the code @pygment-code[#:lang "js"]{if (n < 5) return n + 1; if (n > 5) return n - 1; return n;}

You can run it yourself a few times and see that it's a little better than randomly picking. Actually it's probably a lot better than randomly picking, because chances are if Beth tries to pick a ``random'' number herself it won't end up being that random. 

What are some of your strategies for maximizing Beth's mark?