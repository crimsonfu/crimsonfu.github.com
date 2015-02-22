---
title: Owners of organizations on GitHub should (carefully!) set up third-party application restrictions
layout: post
author: pdurbin
---
Early in 2015, GitHub [blogged](https://github.com/blog/1941-organization-approved-applications) about how owners of organizations can set up a whitelist of trusted third-party applications.

> "With this protection in place, all applications need your explicit approval before they can access your organization's resources."

That... sounds good. But what if I **don't** put this protection into place? **What is the default setting?**

Apparently the default third-party application access policy (at least for existing organizations) is "Policy: No restrictions... **All applications authorized by organization members have access to \[your organization\]'s data.**"

<img src="/images/default-third-party_application_access_policy.png">

Hold on. **Any member of my GitHub organization can authorize an application to access my organization's data?** Even members of teams that only have read-only access? Do I have any visibility into which applications have already been authorized by members? When members of my organization are offered to authorize an application, what does it look like?

I'm pretty sure members are prompted to review permissions and click an "Authorize application" button like this:

<img src="/images/public-repo-scope.png">

Yikes! Don't click the button! As an "owner" of an organization on GitHub, please let me click the "Setup application access restrictions" button first! I want to be able to approve access.

I click "Setup application access restrictions" and I'm prompted for confirmation:

<img src="/images/confirm-third-party_application_access_policy-change.png">

Ok, this sounds like what I want. Why isn't this the default? Oh, I see... "Restricting access will immediately block all unapproved applications and will disable SSH keys created before February 2014." That certainly has the potential to break stuff, it sounds like. And the link to https://help.github.com/articles/about-third-party-application-restrictions/#setting-up-third-party-application-restrictions explains how other stuff can break under "When an organization admin sets up third-party application restrictions for the first time..." In particular, deploy keys will be revoked. I don't want deployments to fail.

Time passes and I've alerted my team that I'm going to click the "Restrict third-party application access" button. I click it.

<img src="/images/brace-yourself-github.png">

Success! The policy now says "Access restricted." Phew! I feel much better. Time to make sure nothing broke. Are my deployments still working? Do any apps we rely on need to be re-approved?

Meanwhile, I notice that it's possible to revert to the default. When I click the "Remove restrictions" button, I see a stern warning:

> "Removing third-party application restrictions will immediately give member authorized applications access to private data in \[your\] organization."

<img src="/images/remove-restrictions.png">

Similar language is used at https://help.github.com/articles/disabling-third-party-application-restrictions-for-your-organization/ in angry red:

> "Warning: When you disable third-party application restrictions for your organization, any organization member will automatically authorize application access to the organization's private resources when they approve an application for use in their personal account settings."

What a scary default.

I've been discussing all this in #crimsonfu on freenode. The other day [I said](http://irclog.perlgeek.de/crimsonfu/2015-02-16#i_10124315),

> "I've concluded that the permisions being requested by that application *are* too broad. But at the same time, it's completely nuts to me that a member who has been only granted read-only access to an organization can authorize an app to have *write* access to all public repos of an organization. Again, this is the default."

I don't mean to pick on [applications that request broad access](https://github.com/prose/prose/issues/816). And from what I can tell GitHub is trying to do the right thing. They're trying to encourage organization owners to carefully set up application access restrictions. And so am I. I'm sorry for implying someone is nuts. I suspect this is a case of unintended consequences. I love GitHub and I'm simply trying to raise awareness of this issue.

If you have any feedback on this post, please provide it in [#crimsonfu](http://webchat.freenode.net/?channels=crimsonfu) on freenode, which is logged at http://irclog.perlgeek.de/crimsonfu/today
