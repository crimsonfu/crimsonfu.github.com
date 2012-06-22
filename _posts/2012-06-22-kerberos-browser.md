---
title: Kerberos Authentication with your Browser
author: shuff
layout: default
---

Some web browsers implement the [SPNEGO](http://en.wikipedia.org/wiki/SPNEGO) mechanism, which enables them to negotiate Kerberos authentication with properly configured web services. In order to configure your web browser to use SPNEGO, you'll need to have configured your workstation to obtain a Kerberos ticket (doing so is outside the scope of this document).

For the browsers I have at hand, this consisted of telling them to permit negotiation with hosts that match some sort of wildcard expression.  I use Harvard-specific examples here; adjust appropriately for your environment.

!! Firefox

1. In your browser, open `about:config`.
1. Set **network.negotiate-auth.delegation-uris** to `harvard.edu`.
1. Set **network.negotiate-auth.trusted-uris** to `harvard.edu`.

That's it! These settings should immediately take effect.

!! Chrome

Pass the following command-line arguments to Chrome/Chromium:

    --auth-server-whitelist="*.harvard.edu"
    --auth-negotiate-delegate-whitelist="*.harvard.edu"
    --enable-auth-negotiate-port (this is optional)

Setting up a means of automatically passing these arguments to Chrome varies by platform, and is universally annoying.

!! Safari

Once your Mac is configured to be able to obtain a Kerberos ticket, Safari requires no additional configuration to use SPNEGO.  Hooray!

! Why?????

The significant advantage of doing so is that you can then talk to Kerberized web services, which means less typing/pasting/[LastPass](https://lastpass.com/)ing in credentials to various little authentication prompts (and ideally fewer cheesy `admin`/`passw0rd` credentials) and more getting work done.
