    Title: Some tips for CS246
    Date: 2015-06-20T02:26:49
    Tags: cs246

I'm not saying I've seen some poor code, but here are best practices that might improve your time in CS246.

<!-- more -->

# Compiler switches

Use these when compiling your code. When we get to makefiles don't forget to add them to your makefiles.

## Be pedantic

When compiling, use the switch `-pedantic`. It'll turn on more warnings, and we're most likely not going to get into weird edge cases where those warnings can be ignored. Warnings are good, because they often hint at a bug or something you didn't intend to do.

## Follow a standard

CS246 (like many CS courses) is still stuck in the past, so no C++11 features for us. But also use `-std=c++03` because you don't want to get caught using compiler extensions that they won't support.

## A wall of warnings

Use `-Wall`. Get into the habit of it now and you won't have any problems. Enabling all warnings on an existing codebase is impractical but for our tiny programs it's a good idea (see entry on pedantic mode above).

## AddressSanitizer / Valgrind

Enable the address sanitizer with `-fsanitizer=address`. You'll most likely want `-g` as well so that you can get debug symbols, which give you line numbers instead of memory offsets. This brings you all your favourite memory checking features from CS136, at only a 2x slowdown cost.

Alternatively, you can use Valgrind. There are good piazza posts on that.

## Optional: Warnings as errors

Have you ever had your compiler barf out a few pages of error messages just because you did `cin << i` or something stupid? Now imagine doing that, and a few other minor errors. To make it worse the error messages might be a little obtuse for a beginner.

# Tools

## cppcheck

Static analysis tools check your program for bugs without actually running them. An simple tool is [cppcheck](http://cppcheck.sourceforge.net/). It can check for a variety of errors. For example, it detected that I had forgotten to copy over a field in an assignment operator overload. It can also check for very simple memory leaks. Here's a [list of all the things it can check for](http://sourceforge.net/p/cppcheck/wiki/ListOfChecks/).


## Valgrind

Valgrind was introduced to us as a memory leak checker but it can do a lot more than that. It can find memory errors in general, such as heap overrun/underruns, and using uninitialized memory. A full explanation of all the memory explanations can be found in the [Valgrind docs](http://valgrind.org/docs/manual/mc-manual.html#mc-manual.errormsgs).

Since Valgrind does slow your program down you can compile your program with some optimizations enabled with `-O1`, but apparently this can fudge up line numbers. `-O2` gives false positives for memory errors. For our baby programs the slowdown shouldn't matter.

## ClangFormat

[ClangFormat](http://clang.llvm.org/docs/ClangFormat.html) automatically formats your code to conform to certain style settings. Place your settings in a file named `.clang-format` or `_clang-format` at the top of the 1155 dir and run `clang-format -i -style=file file.cc` to format file.cc with the settings in your formatting file. Clang-Format will go up the dir structure until it finds a formatting file, so this way you can use one file for all of your assignments. This is a lot more useful than the dumb auto-indent from Seashell. To get you started, here is [my clang-format file](/d/_clang-format). See the docs for more information, including vim/emacs integration.

