# IMAP/SMTP Setup

These are standard the IMAP/SMTP settings required for most mail clients.

| Setting                              | Value                     |
|--------------------------------------|---------------------------|
| Username                             | username@edu.uwaterloo.ca |
| Password                             | WatIAM password           |
| Authentication                       | "Normal password"         |
| Incoming Mail Server (IMAP)          | `outlook.office365.com`   |
| Incoming Mail Server Port + Security | 993 SSL/TLS               |
| Outgoing Mail Server (SMTP)          | `smtp.office365.com`      |
| Outgoing Mail Server Port + Security | 587 STARTTLS              |

# Forwarding Emails

As of 2017-05-07, email settings in WatIAM
are locked. To forward from Office 365, navigate to
[https://outlook.office.com/owa/?path=/options/inboxrules](https://outlook.office.com/owa/?path=/options/inboxrules)
and create a new inbox rule. (Alternatively, click through Options > Mail >
Automatic Processing > Inbox and sweep rules.)

1. Enter a name for the rule
2. `When the message arrives, and it matches all of these conditions`: "[Apply to all messages]"
3. `Do all of the following`: "Redirect the message to..."
4. Enter the redirect address at the top
5. Add an action to delete the message if desired
6. Check "Stop processing more rules" because you probably don't care about the message anymore

