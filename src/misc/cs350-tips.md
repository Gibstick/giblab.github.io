This document is a collection of quality-of-life improvement tips for working
with sys161 and os161 in CS 350. It is up to date for the Fall 2016 term. It
does not include tips that are already given in course handouts/documents.

# Compiling for own machine

The toolchain for os161 and sys161 is ancient. It doesn't really compile
any more on modern versions. The easiest way to get things to compile is
to get an old version of a compiler. gcc 4.8 has been reported to work,
as well as gcc 4.7. Versions as old as gcc 3.4 were also working.

To use a custom version of gcc, set the `CC` environment variable before
running the configure script. For example, `CC=gcc4.8 ./configure blah blah`
or `export CC=gcc4.8`. The latter is recommended if you're going to configure
a lot. If all else fails, symlink `/usr/bin/gcc` to the appropriate version.


## Ubuntu

Luckily, there are packages for old versions of gcc, so

```
apt install gcc-4.8
```

should work on trusty to yakkety. If you are on precise, the version of gcc
shipped with it is old enough anyway.

## Debian

Debian packages are ancient: jessie is still on 4.8, so you should be
fine. Otherwise, future versions (testing, unstable) should have `gcc-4.x`
packages that you can use.

## Fedora

Fedora 24 and probably others should offer the package `compat-gcc-34`,
so install that with

```
dnf install compat-gcc-34
```

## OSX / macOS

The easiest way to get an old version of gcc is with
[macports](https://www.macports.org/). Install that, and then

`port install gcc48`

There's probably a way with homebrew as well.

## Other

Compiling an old version of gcc from source is actually kinda hard because
new versions of gcc don't compile it anymore! Try to get an old version
by some other means. I haven't been able to compile gcc 4.8 from source
successfully on Fedora 24, for example.


# Break on panic

In `os161-1.99/kern/lib/kprintf.c`, go to the definition of `panic` and
insert a break instruction.

```
__asm("break");
```

Sys161 and os161 will handle this and bring up the "waiting for debugger
message", and now you can attach a debugger to figure out precisely where you
crashed. This is for when you're too lazy to add a breakpoint in GDB yourself.
For bonus points, you can set a flag at runtime to determine whether or not
this is enabled.

# Break during an infinite loop

If you're in some sort of loop or deadlock and none of your breakpoints are
triggering, you can simply attach a debugger at that point and it will break
for you. No need to guess where to put the breakpoint.

If you're already in the debugger and you want to pause execution, a normal
^C won't work. You can patch sys161 to respond to a signal such as SIGUSR1
to pause things. This is useful for when you're already in the debugger and
you're inside an infinite loop.

For a ready-made patch, see
[http://www.student.cs.uwaterloo.ca/~s455wang/break_on_sigusr1.patch](http://www.student.cs.uwaterloo.ca/~s455wang/break_on_sigusr1.patch).
Copy that to the top level of the sys161 source tree and apply it with `git
apply break_on_sigusr1.patch`.  You do not need to have a git repository to
apply the patch.

# Symlinks to the currently configured assignment

This is a prerequisite for the next two sections.

Much like how the makefiles include a symlink from `kernel` to
the current assignment, eg. `kernel-ASST0`, it's useful to create
a symlink from `kern/compile/CURRENT` to the current compile
directory. Patch `kern/conf/config` with the patch located at
[https://www.student.cs.uwaterloo.ca/~s455wang/config-link.patch](https://www.student.cs.uwaterloo.ca/~s455wang/config-link.patch).

# gdbinit that points to the current assignment

With the previous tip in place, let your .gdbinit file be

```
dir ../os161-1.99/kern/compile/CURRENT
target remote unix:.sockets/gdb
```

Now you no longer have to modify gdbinit for every assignment.

# Syntastic

[Syntastic](https://github.com/scrooloose/syntastic/) is a syntax checker
for vim. Requires the symlink tip to be set up.

Syntastic can be set up with some effort. First, you need a
`.syntastic_c_config` file at the top level of the source tree with the
following contents:

```
-Iuser/include
-Ikern/include
-Ikern/compile/CURRENT
-Ikern/compile/CURRENT/includelinks
-Ikern/dev
-std=gnu99
-Wall
-Wwrite-strings
-Wmissing-prototypes
-nostdinc
-D_KERNEL
-DUW
```

These are ripped straight from the makefiles. Without these, syntastic will
complain loudly about not being able to find just about every header file.

If you are only going to use syntastic for cs350, you can afford to be lazy
and put `let g:syntastic_c_compiler = "cs350-gcc"` in your .vimrc. This is
necessary because of all the MIPS assembly that would otherwise show up as
errors when checking.

If you use syntastic for checking other non-cs350 C code, install the
[localrc](https://github.com/thinca/vim-localrc) plugin and place the above
setting in your `.local.vimrc` as per the plugin documentation.

I believe that this is one of the most useful tips as it saves you a lot of
time trying to fix compilation errors.

# Ctags

According to the [CS350 os161
FAQ](https://www.student.cs.uwaterloo.ca/~cs350/common/os161-faq.html)
the student.cs environment is supposed to have Exuberant Ctags, but it
doesn't. You can [install it yourself](http://ctags.sourceforge.net/) in your
home dir and then you can use ctags. The only keybindings I really use are
`Ctrl-]` to go to the definition of a tag, and `Ctrl-T` to go up the tag stack.

# Run Tests Repeatedly

Due to some quirkiness with how sys161 takes input, simply piping output
to `sys161` makes it hang. The alternative is to send long strings on the
command line.  There's a limit for how long your arguments can be but you won't
reach it even with 400 tests or so. Here's a [script](/static/repeat-test.sh)
for it [(preview)](/static/repeat-test.html).

This is most useful in assignment 3.

