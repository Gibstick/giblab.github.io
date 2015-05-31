    Title: How to fix Atheros A8161 / Atheros Killer E2200 Ethernet in Linux
    Date: 2015-05-30T21:24:21
    Tags: tutorials, linux

I just spent a significant number of hours trying to fix the Ethernet card in my MSI GS60 laptop on Ubuntu 15.04. Turns out there's a [bug in the drivers](https://bugzilla.kernel.org/show_bug.cgi?id=70761) that's been around since February (!), and it's still present on version 4.0.4 of the kernel. The workaround is to set the MTU to 8192. This works for both the A8161 and the E2200 card. Assuming you're on eth0,

```console
sudo ifconfig eth0 mtu 8192
```

<!-- more -->

Note that the [bug report](https://forum-en.msi.com/index.php?topic=168097.0) is for the A8161 card. The MSI GS60 has the Killer E2200 card. ```lspci``` (on Ubuntu 15.04, but likely any other distro) identifies it as 

```console
$ lspci | grep -i net
Ethernet controller: Qualcomm Atheros Killer E220x Gigabit Ethernet Controller (rev 13)
```

But it turns out that [people have been using AR8161 drivers for this card on Windows](https://forum-en.msi.com/index.php?topic=168097.0). I guess the drivers for these cards are similar enough that the bug exists for the E2200, and the workaround works too. 

Hopefully this will save you a lot of trouble.
