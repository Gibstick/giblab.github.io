    Title: OCDSB Career Cruising: What are passwords?
    Date: 2015-05-04T19:42:33
    Tags: security

From 2010 to 2015 at least, The Ottawa-Carleton District School Board used the eponymous course management system from [Career Cruising](http://public.careercruising.com/en/). It was a web application that let students view grades and register for courses in upcoming terms. There were management features as well that allowed guidance counselors (the high-school equivalent of academic advisors) to upload grades or something. The system worked fairly well, but up until 2014, your password would get reset to your birthday every year. This turned out to be a significant security flaw.

<!-- more -->

Of course, every user had a password of the same format. And most users didn't bother to change their password after the reset until they had to use the system again, which was much later. Birthdays are not private information. Despite my lack of experience I determined it was feasible to scrape birthdays from Facebook using their API. Additionally, usernames were student IDs, and the school computer system--Windows XP computers on a domain--had a handy tool, Active Directory Search, that allowed one to lookup student IDs just by searching someone's name. Presumably this step could be automated as well.

The easiest way to exploit this is with a targeted attack. Once a birthday and student ID pair are obtained for one person, an attacker can register the student for useless courses. I suppose the worst case would be a delayed graduation, if the guidance department doesn't step in to fix it. The attacker could also blackmail a student by threatening to disclose grades. On the other hand, a denial of service attack is also possible if a large number of student ID/birthday pairs are obtained, which would swamp the guidance department. With these possible attacks in mind, the flaw can be seen to be fairly severe.

Mitigation includes changing your password as soon as it gets reset. Although not practical, you could also not give out your birthday.

On February 19, 2014, the vulnerability was eventually reported to a student trustee in the OCDSB, who was also a good friend. Eventually, the OCDSB contacted Career Cruising and the password system was overhauled. When I left, randomly generated passwords were distributed in-person from the guidance department.

The passwords were probably stored in plain text. Oh well.