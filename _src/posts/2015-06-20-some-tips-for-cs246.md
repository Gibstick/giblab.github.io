    Title: Some tips for CS246 assignments
    Date: 2015-06-20T20:11:00
    Tags: cs246

CS 246 is a complicated course. Anyone who says CS 246 is easy probably already knew everything in it. The tools and best practices outlined below are all things that will help you stay organized and become a better programmer in 246.

<!-- more -->

# UML

If you hate doing layout by hand, you'll appreciate [PlantText](http://www.planttext.com/), an online UML editor that renders very nice looking UML diagrams from a text format that basically resembles Java pseudocode.

The UML basics can be found in the provided samples in the dropdown menu above the editor, under **Class Diagram**. Examples 1 and 2 are the most relevant.

To get rid of the icons and other spurious style features, put

```
skinparam classAttributeIconSize 0
skinparam circledCharacterRadius 0
skinparam circledCharacterFontSize 0
```

in your UML text.

# Compiler switches
Use these when compiling your code. Add them to your makefiles too, of course.

## Be pedantic
When compiling, use the switch `-pedantic`. It'll turn on more warnings, and we're most likely not going to get into weird edge cases where those warnings can be ignored. Warnings are good, because they often hint at a bug or something you didn't intend to do. Only ignore them if you know what you're doing (I almost never ignore warnings).

## Follow a standard
Use `-std=c++03` because you don't want to get caught using compiler extensions that they won't support. For example, [variable-length arrays](https://gcc.gnu.org/onlinedocs/gcc/Variable-Length.html#Variable-Length).

## A wall of warnings
Use `-Wall`. Enabling all warnings on an existing codebase is impractical but for our tiny programs it's a good idea (see entry on pedantic mode above).

# Tools
## cppcheck
Static analysis tools check your program for bugs without actually running them. An simple tool is [cppcheck](http://cppcheck.sourceforge.net/). It can check for a variety of errors. For example, it detected that I had forgotten to copy over a field in an assignment operator overload. It can also check for very simple memory leaks. Here's a [list of all the things it can check for](http://sourceforge.net/p/cppcheck/wiki/ListOfChecks/).

## clang-analyze

Similar to cppcheck, [clang-analyze](http://clang-analyzer.llvm.org/) is another command-line tool you can use to check your code for bugs. This one is already installed on the student environment along with clang. Use it by invoking [scan-build](http://clang-analyzer.llvm.org/scan-build.html). For example, it can find unused variables.

Usage: `scan-build make`

## Valgrind

Valgrind was introduced to us as a memory leak checker but it can do a lot more than that. It can find memory errors in general, such as use-after-free, and using uninitialized memory. A full explanation of all the memory explanations can be found in the [Valgrind docs](http://valgrind.org/docs/manual/mc-manual.html#mc-manual.errormsgs).

Don't panic if Valgrind reports a memory "leak", especially in a program that doesn't allocate any memory explicitly. Near the end of the course, you'll be linking to external libraries for your assignments, such as X11 for A4 and A5. These libraries, and even the C++ standard library aren't as strict as CS 136/246 about freeing memory at exit, and Valgrind will notice. But this isn't a memory *leak* per se, because the OS will reclaim that memory anyway. This will show up in the heap summary as "in use at exit", and in the leak summary as "still reachable":

```
$ less valgrind.log
==17073== Memcheck, a memory error detector
==17073== Copyright (C) 2002-2011, and GNU GPL'd, by Julian Seward et al.
==17073== Using Valgrind-3.7.0 and LibVEX; rerun with -h for copyright info
==17073== Command: ./cc3k
==17073== Parent PID: 16720
==17073==
==17073==
==17073== HEAP SUMMARY:
==17073==     in use at exit: 411,048 bytes in 183 blocks
==17073==   total heap usage: 194 allocs, 11 frees, 415,292 bytes allocated
==17073==
==17073== LEAK SUMMARY:
==17073==    definitely lost: 0 bytes in 0 blocks
==17073==    indirectly lost: 0 bytes in 0 blocks
==17073==      possibly lost: 0 bytes in 0 blocks
==17073==    still reachable: 411,048 bytes in 183 blocks
==17073==         suppressed: 0 bytes in 0 blocks
==17073== Rerun with --leak-check=full to see details of leaked memory
==17073==
==17073== For counts of detected and suppressed errors, rerun with: -v
==17073== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 2 from 2)
```

You can safely ignore these, and Marmoset won't flag these either. You can check exactly where these allocations are happening with `--leak-check=full`, where you should see stack traces of library code and not your own.

Since Valgrind does slow your program down you can compile your program with some optimizations enabled with `-O1`. The Valgrind docs will warn you that this can fudge up line numbers, but I haven't seen this happen with my code.

Usage: `valgrind ./yourbinary`.

## A Better runSuite

To help catch obscure formatting errors, you can modify your runSuite script to print a diff of the test output compared to the expected output. I prefer the formatting of git diff, so I would modify my runSuite to run this upon failure:

```bash
git --no-pager diff --no-index "$actual" "$expected"
```

If you're using git diff, the `--no-index` switch is necessary because you don't want to compare within a git tree. As well, `--no-pager` prevents the command from running a pager like `less`, which is useful because you'll probably want to redirect the output somewhere yourself.

------

What tips do you have for CS 246?
