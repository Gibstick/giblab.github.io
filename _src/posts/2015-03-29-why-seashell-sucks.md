    Title: Why Seashell seems to suck
    Date: 2015-03-29T01:49:58
    Tags: cs136

It's the night before the assignemnt is due, and you have errors out the wazoo. You debug furiously with a frown. All of a sudden, Seashell is down! **FIX IT.**

In all seriousness, it's not really Seashell's fault. Here's why.
<!-- more -->

Seashell is a great project, built by some very talented developers at Waterloo and various other contributors. Your ISA might have worked on Seashell this term. See [Seashell's github](https://github.com/cs136/seashell). It also has other contributors, like CS 136 students. All this to say, the core Seashell developers know what they're doing. Pretty sure the lead developer is getting paid for it too.

When Seashell goes down it's almost always because of the CSCF's (Computer Science Computing Facility) servers going down or becoming generally unresponsive. Seashell uses three backend servers, and these backend servers are shared with pretty much everyone in the CS faculty. So you have other people doing work on these servers, running their programs, etc. Marmoset also runs its tests on these servers. Other courses also run their tests on these servers. Sometimes, people (perhaps unintentionally) hog a lot of system resouces. This kills the server. What follows is an explanation of some of the issues we've had this year.

The most recent incident involved Seashell not running/testing any files. Saving probably wasn't working too. The culprit was CS 341 running tests that ate up 100% memory and 100% CPU. At one point they brought down two servers this way. 100% memory means 128GB of memory; at some other point they brought down the beefier server with 256GB of memory.

This other time, someone ran a [fork bomb](http://en.wikipedia.org/wiki/Fork_bomb) on one of the servers, rendering that backend server unresponsive. A fork bomb is basically a program that calls itself over and over, multiplying and using up system resources and process IDs. There are ways to prevent this, but the servers aren't configured to do so.

For some reason, when Marmoset stops testing, the web servers get slow. When this happens Seashell takes dozens of seconds to load, but once you're in it's generally OK. Marmoset issues are not new[(1)](https://www.reddit.com/r/uwaterloo/comments/3021ga/am_i_the_only_one_who_thinks_cs_136_has_been_a/cpos958)[(2)](https://www.reddit.com/r/uwaterloo/comments/3021ga/am_i_the_only_one_who_thinks_cs_136_has_been_a/cpol9ca), and they're caused by the enormous load from ~800 students submitting the night before.

Don't blame the people who work hard on Seashell. It's a lot better than what came before: RunC in VirtualBox. VirtualBox is mediocre at best, and it's an absolutely horrible experience on low-end computers. Before that, they just told people to code with a terminal[(3)](https://www.reddit.com/r/uwaterloo/comments/3021ga/am_i_the_only_one_who_thinks_cs_136_has_been_a/cpp5qse) (it's that hacker thing with all the text and commands), which probably scared away a lot of people. Seashell is nice and it abstracts away all these messy details.

In a later post I'll cover my CS 136 workflow. I didn't actually use Seashell that often, since I wanted to learn and get used to certain things that would be required for later courses and programming industry in general.
