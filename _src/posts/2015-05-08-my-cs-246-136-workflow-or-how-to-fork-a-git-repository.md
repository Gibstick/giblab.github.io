    Title: My CS 246/136 workflow, or how to fork a git repository
    Date: 2015-05-08T15:25:06
    Tags: cs136, cs246, tutorials

The instructions for CS 246 are quite simple: clone the course repository so that you have your own local copy, and then pull from it periodically while committing to it for your own assignments. This is fine, but then you have to resort to rsync or scp to keep files synchronized between the linux.student.cs servers and your own computer; realistically, not everyone wants to ssh in and use vim. These instructions will show you how to have your own local repository that you can sync with a remote one using only git, which I find quite convenient. I used this for CS 136 and I'm using it now for CS 246.

<!-- more -->

The goal here is to have a central repository of sorts, just for synchronization. It replicates GitHub's "fork" functionality by giving you your own remote repository that you can push to. This is desirable because syncing files becomes a simple git pull/git push (and maybe a merge or two), and the student environment servers have good [backups](http://math.uwaterloo.ca/math-faculty-computing-facility/recover-files) and uptime--they likely won't fail completely, unlike your cheap laptop. Also, if the student environment goes down, it's not your responsibility to fix it (ie. courses will make accommodations for it), unlike your laptop.

If you haven't set up SSH keys yet, I recommend you do so first. The [Ubuntu docs](https://help.ubuntu.com/community/SSH/OpenSSH/Keys) are a good guide. If you have SSH keys set up, replace the HTTPS URLs below with the corresponding SSH ones.

First set up a bare clone of the repository.

```bash
cd ~/cs246
git clone --bare https://git.uwaterloo.ca/cs246/1155.git
```

Then clone it again for your own working copy of it.

```bash
git clone 1155.git
```

On your own computer, clone using ssh from your own bare repository. Don't forget to clone from the bare repository; note that by convention bare repositories are appended with .git.

```bash
git clone ssh://userid@linux.student.cs.uwaterloo.ca/~/cs246/1155.git
```

Then in both systems, you need to add an "upstream" URL so that you can fetch and pull from the offical course repository. The name doesn't have to be upstream, but remember to use the correct name in the other commands.

```bash
git remote add upstream https://git.uwaterloo.ca/cs246/1155.git
```

Now to "pull from upstream" you need to first fetch, and then merge. This is what you do instead of git pull if you want to update from the course repository to get new assignments and handouts. CS 246 should stay on the master branch.

```bash
git fetch upstream
git merge upstream/master
```


To synchronize files between your computer and the linux.student.cs servers, use git pull/push. For example, you could be working on assignment and finish part of it in one night. You commit and push. Then the next day you can go to a computer lab, log in, and pull to resume work from where you left off. Of course, this workflow is also compatible with other workflows such as the [feature branch workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow), but it might be overkill for assignments.
