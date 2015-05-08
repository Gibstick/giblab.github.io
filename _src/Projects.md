# Projects

## [cs136-autosubmit](https://github.com/Gibstick/cs136-autosubmit)

Python script for automatically submitting assignments to Marmoset, the central submission server. Had to submit several patches for the [Marmoset library](https://github.com/hkpeprah/marmoset) I was using, and as of now there's still [a bug](https://github.com/hkpeprah/marmoset/pull/23) with zip files being opened in text mode, which messes them up quite a bit. Wrote this and the next project because I didn't want to be dead in the water when Seashell went down.

## [cs136-bunny](https://github.com/Gibstick/cs136-bunny)

Packaged python program for I/O testing, compatible with CS 136's testing format. Outputs a more useful diff, unlike the tool they use.

## [DiscoSheep](https://github.com/Gibstick/DiscoSheep)

A from-scratch remake of the popular bukkit plugin DiscoSheep. It spawns dancing sheep, and I guess the disco part of it is that they change colour. Somehow it still works with Spigot.

## [LoginSecurity-2](https://github.com/lenis0012/LoginSecurity-2)

Over the summer, I contributed significantly to this bukkit plugin. It provides a separate authentication system for Minecraft servers that doesn't rely on Minecraft's own accounts, so that servers can link accounts to external forum accounts and such. Features I added included a better "lockout" feature to prevent unauthenticated players from doing anything, and to prevent them from getting killed. There were a lot of potential vectors to exploit since Minecraft is such a complicated game but I eventually worked out a nice implementation. I also added support for bcrypt password storage--a lot better than SHA or even MD5 that they had before!

## [latex-fontawesome](https://github.com/Gibstick/latex-fontawesome)

A fork of an [outdated original](https://github.com/furl/latex-fontawesome), which itself was an update of another older version. It provides FontAwesome icons in XeLaTeX. Didn't really do much for this one.


Other projects and contributions to projects can be found on my [GitHub profile](https://github.com/Gibstick).

### Odd scripts

Not that impressive, but they could be useful.

[CS 136 Mark Calculation Script](https://gist.github.com/Gibstick/7bb97dbedc8ca2a0c67c) calculates your mark in CS 136 before going into the exam. It probably breaks when you don't have the required marks (need midterm mark).

[Desire2Perfect](https://gist.github.com/Gibstick/6a2d6e753c38f4335e2c) makes Learn display all grades as 100%.

