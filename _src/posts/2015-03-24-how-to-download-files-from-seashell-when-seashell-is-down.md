    Title: How to download files from Seashell when Seashell is down
    Date: 2015-03-24T16:08:55
    Tags: cs136, tutorials

We all love Seashell, because the only course-sanctioned alternative would be to use RunC inside VirtualBox. But sometimes, the CSCF servers buckle under our load, and then Seashell becomes slow or inaccessible at times. Here's how to get your files from Seashell, even if Seashell is down.
<!-- more -->
Windows Users
=============

1. Navigate to This PC / My Computer.
2. Click "Map Network Drive"
3. Pick any drive you want, maybe W: for Waterloo, and for Folder, enter `\\smb-files.student.cs.uwaterloo.ca\USERID` where USERID is your Quest/WatIAM/whatever username.
4. Enter `\CS-TEACHING\USERID` as the username. If you've used Seashell before, enter your standard Waterloo password here. If this doesn't work, [reset your password](https://www.student.cs.uwaterloo.ca/password/).
5. Now enter your newly-added network drive. Optional: Show hidden files/folders by going to View > tick "Hidden items" from the menubar.
6. If you didn't want to show hidden files/folders, append `.seashell` to the path in the location bar and press enter. Otherwise, enter the `.seashell`folder. It will appear greyed out because it is a hidden folder.
7. All your Seashell projects will be in the `projects` folder. You can copy these files as you would for any other file in Windows. Don't move/delete anything unless you know what you're doing, but copying is safe.

<a href="/img/pub/windows_network_drive_.png"><img src="/img/pub/windows_network_drive_.png" alt="Screenshot of This PC / My Computer" style="width: 500px;" /></a>
![](/img/pub/windows_logon.png)
![](/img/pub/windows_seashell_folder.png)

Mac Users
=========

Note: these instructions work for the Mac Labs too, but you can skip step 6.

1. Open Finder.
2. From the menu, Go -> Connect to Server... (command-K)
3. Enter ``smb://smb-files.student.cs.uwaterloo.ca/USERID`` as the Server Address, where USERID is your Quest/WatIAM/whatever username.
4. Optional: Click the "+" icon to add it to favourites.
5. Click Connect.
6. Enter your username/password. I don't have a MAC so I don't know how this step would work, but I think you can just enter it normally. If this doesn't work, [reset your password](https://www.student.cs.uwaterloo.ca/password/).
6. Navigate to the  `.seashell` hidden folder: Go > Go to Folder (Shift-Command-G), type `.seashell`. Go.
7. All your Seashell projects will be in the `projects` folder. You can copy these files as you would for any other file. Don't move/delete anything unless you know what you're doing, but copying is safe.

![](/img/pub/Mac_smb_add.png)
![](/img/pub/Mac_finder_goto_seashell.png)

Linux Users
===========

Coming soon, but for now, the Seashell files are all stored under `~/.seashell/projects/` on `linux.student.cs.uwaterloo.ca`. If you know how to mount SMB shares (I don't), the address is `smb://smb-files.student.cs.uwaterloo.ca/USERID` where USERID is your username.