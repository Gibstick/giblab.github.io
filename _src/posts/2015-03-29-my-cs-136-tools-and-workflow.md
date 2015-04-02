    Title: My CS 136 tools and workflow
    Date: 2015-03-29T01:10:07
    Tags: DRAFT, cs136

I'm writing yet another post about CS 136 as the term comes to an end. This one includes an introduction to some of my side projects I worked on this term, and an overview of my workflow for doing assignments. Consider it a very basic tutorial on makefiles, which are used in CS 246. It's also a crash course for git, but if you're just copy-pasting (like I did when I started out) you won't learn much.

<!-- more -->
Basic Setup
===========

Although Seashell gets a lot of flak, it's actually a great tool. Almost all of its problems can be traced back to CSCF's poor management of its servers. More on this later. So my setup still allows for Seashell to be used for debugging if necessary, which is nice because I'm too lazy to get clang with AddressSanitizer working on my system.

A bit of optional background information first. Seashell projects are stored in `~/.seashell/projects`, and each project is its own [git repository](https://en.wikipedia.org/wiki/Git_%28software%29). The assignments are cloned from `~cs136/public_html/assignment_skeletons/`. I'm not sure how they update the files once they've been cloned--perhaps Seashell automatically pulls every time you open the project (and if you've made changes, it just lets it fail?). If you look though the git logs, you'll find interesting things.

Setting up the repository
-------------------------

git is a nice system and we want to keep it. That way we can always revert to working copies of our assignments, and it makes backups easy too. First we have to change the remote of the repository to one that we own.

Here's an example of what I did for A10.

I set up a directory for holding the bare repositories, and then create the bare repo
`cd ~/cs136/assignments/bare`
`git init --bare a10.git`

Then changed the origin to point to my new bare repository:
`cd ~/.seashell/projects/A10`
`git remote set-url origin file:///u/s455wang/cs136/assigments/bare/a10.git`
(I'm a noob so I couldn't get ~ to expand properly)

Finally `git push origin master` to actually populate the repo with a master branch.

Cloning
----------------

Then I