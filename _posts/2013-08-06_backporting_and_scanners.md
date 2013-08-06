---
title: Vulnerability Scanners and Red Hat Enterprise Linux
author: shuff
layout: default
---

I'm capturing this information here because I find that I deliver some version of this rant roughly once every six months, and it would be really nice to not have to keep doing so.

--- BEGIN RANT ---

> > I have manually verified that foo.harvard.edu servers are still
> > highly vulnerable due to out of date versions of Apache, PHP, and cURL.
> > The latest security updates are available for these products, and the
> > attached report shows from where the updates can be downloaded.
> >
> > Can we patch these servers before August ? I hope that we can achieve
> > this, so that our customer can meet their August 1st deadline.
> 
> so, the cURL vulnerability is within our capacity to patch; as your
> document shows, Red Hat released an updated package on 6/25/2013 that
> patches this vulnerability.  this package will be synced into our next
> patch snapshot, which will be prepared shortly before the end of July;
> we can certainly do our best to make sure that this server is patched as
> quickly as possible after the next patch snapshot is available, provided
> the customer is able to cooperate.
> 
> as for the other vulnerabilities, "upgrad[ing] Apache and PHP to the
> latest stable version" is simply not a solution that makes sense within
> the context of an enterprise Linux distribution like RHEL.  please, if
> you have not already done so, read the following document:
> 
> https://access.redhat.com/security/updates/backporting/
> 
> Red Hat, as a matter of policy, does not change the version number of
> its supported packages during a major release (and the lifecycle of a
> major release is on the order of seven years), except under exceptional
> circumstances.  the server in question runs RHEL5, which means that the
> packaged version of Apache is 2.2.3.  however, that version of Apache is
> NOT a vanilla build of Apache 2.2.3 as shipped by the Apache Project on
> July 28, 2006.  instead, it contains backported fixes for security
> vulnerabilities discovered since then; therefore it is NOT necessarily
> vulnerable to exploits that would successfully attack a vanilla Apache
> 2.2.3.
> 
> the same is true for PHP, and for all the other packages that make up a
> RHEL distribution.  therefore it doesn't make any sense to make
> assumptions about a RHEL system's vulnerability based on version number
> inspection alone; it is necessary to look at the release number as well.
> for example, consider plugin 42052 from the vulnerability report
> attached to the ticket; it checks for vulnerability to CVE-2009-2699,
> CVE-2009-3094, and CVE-2009-3095.  let's look at those in detail:
> 
> CVE-2003-1567 appears in Red Hat's CVE database:
> 
> https://access.redhat.com/security/cve/CCVE-2009-2699
> 
> however, as the documentation shows, this vulnerability only affects
> Solaris systems, and in addition only affects versions of APR (Apache
> Portable Runtime) that are older than the version shipped with RHEL5, so
> this vulnerability is irrelevant to this server.
> 
> CVE-2009-3094 also appears in Red Hat's CVE database:
> 
> https://access.redhat.com/security/cve/CVE-2009-3094
> 
> Red Hat published a series of errata with patches for this
> vulnerability; the appropriate one for this server is here:
> 
> https://rhn.redhat.com/errata/RHSA-2009-1461.html
> 
> this erratum tells us that to patch this vulnerability, we need to
> install httpd-2.2.13-2.el5s2 or later.  let's take a look at the version
> installed on this server:
> 
> [root@fdd-web ~]# rpm -q httpd
> httpd-2.2.13-2.el5s2
> 
> hey, that's the version we need!  this means that even though the Apache
> daemon reports its version as "2.2.13", it is NOT VULNERABLE to
> CVE-2009-3094.
> 
> CVE-2009-3095 also appears in Red Hat's CVE database:
> 
> https://access.redhat.com/security/cve/CVE-2010-0386
> 
> it also has errata associated with it, and its patch is included in the
> same version of the httpd package mentioned above, which is installed on
> the server in question.  that means, again, that this server is NOT
> VULNERABLE to CVE-2009-3095.
> 
> so, what does all this mean?  this means that plugin 42052 shows a FALSE
> POSITIVE when run against the server in question.  as best i can tell,
> the server is not currently vulnerable to any of the CVEs referenced by
> that plugin, and the security scanner doesn't have enough information to
> realize that.  i suspect that the same will be the case for many (but
> maybe not all) of the other plugins in the vulnerability report.
> 
> i am confident that these are only some of the false positives contained in the
> vulnerability report.  i haven't even gotten to the many disadvantages of
> blindly installing custom-compiled Apache and PHP binaries to satisfy
> vulnerability scanners:
> 
> 1. we lose any ability to get support from Red Hat concerning any issue
> we may have with those binaries in the future
> 
> 2. we lose any optimizations and distribution-specific features that Red
> Hat includes in its own packages (these packages are not just about
> security fixes)
> 
> 3. we lose the ability to deploy any other packages from the RHEL
> distribution, or from EPEL, or from any other RHEL-compatible package
> repository, that depend on Apache or PHP binaries
> 
> and we lose all of these things just to satisfy a false positive.

--- END RANT ---
