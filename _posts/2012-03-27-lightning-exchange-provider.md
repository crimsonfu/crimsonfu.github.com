---
title: Calendaring with Thunderbird and Exchange 2007/2010
author: shuff
layout: default
---

Members of the Harvard community will almost certainly have encountered the [Iris Project](http://iris.fas.harvard.edu/), A.K.A "let's all move to Exchange!"  What is an Outlook-fearing sysadmin to do?  Our very own [pdurbin](http://crimsonfu.github.com/members/pdurbin) has already written a helpful guide to [accessing Iris mail via IMAP](http://www.people.fas.harvard.edu/~pdurbin/blog/howto/use-iris-from-linux.html), but what about the glorious calendaring promised by Exchange?

The following procedure worked for me:

1. Install and configure [Thunderbird](http://www.mozilla.org/thunderbird/) (see pdurbin's blog entry for guidance).

2. Install [Lightning](https://www.mozilla.org/projects/calendar/lightning/).

3. Install the [Lightning Exchange Provider](http://www.1st-setup.nl/wordpress/?page_id=133).

4. Now comes the fun part: telling Lightning how to talk to your Exchange server!  These notes are specifically for Harvard folks, but users of other Exchange installations can swap in their site-specific information.

   1. In Thunderbird, select **New**->**Calendar**.

   2. Select **On the Network** and click **Continue**.

   3. Select **Microsoft Exchange 2007/2010** (if you don't have this option, you haven't installed the Lightning Exchange Provider correctly) and click **Continue**.

   4. Name your calendar appropriately and set other cosmetic options.  NOTE: it is important that the email address associated with this calendar is the one served by Exchange, and not some other address!  Click **Continue** when ready.

   5. Make sure **Use Exchange's autodiscovery function** is not checked.

   6. For **Server URL**, enter `https://2007exch.fasmail.harvard.edu/EWS/Exchange.asmx` if you are on Exchange 2007, or `https://fasmail.harvard.edu/EWS/Exchange.asmx` if you have been migrated to Exchange 2010.  If you don't know, you are probably on Exchange 2007.

   7. For **Mailboxname**, enter your full email address (e.g. `<your username>@fas.harvard.edu`).

   8. For **Username**, enter `<your username>`.

   9. For **Domainname**, enter `fas_domain`.

   10. Leave **Share FolderID** blank.

   11. At this point you can test your connection.  Click **Check server and mailbox**.  You should be prompted to authenticate with your AD credentials; do so.

   12. If your test succeeded, you will see two new entries in the dialog box, **Folderbase** and **Path below folderbase**.  Leave these at their default values, and click **Save**.

At this point you're all set!
