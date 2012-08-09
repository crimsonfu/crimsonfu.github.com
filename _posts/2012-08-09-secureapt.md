---
title: Signed Apt Packages
author: shuff
layout: default
---

So, in my experience dealing with [signed Apt](https://help.ubuntu.com/community/SecureApt) is a PITA.  There is, however, a way to pass GPG arguments through `apt-key`, which can make life a lot easier, _e.g._:

    # apt-key adv --keyserver pgp.mit.edu --refresh-keys
    Executing: gpg --ignore-time-conflict --no-options --no-default-keyring
    --secret-keyring /etc/apt/secring.gpg --trustdb-name /etc/apt/trustdb.gpg
    --keyring /etc/apt/trusted.gpg --primary-keyring /etc/apt/trusted.gpg
    --keyserver pgp.mit.edu --refresh-keys
    gpg: refreshing 3 keys from hkp://pgp.mit.edu
    gpg: requesting key 437D05B5 from hkp server pgp.mit.edu
    gpg: requesting key FBB75451 from hkp server pgp.mit.edu
    gpg: requesting key 4BD6EC30 from hkp server pgp.mit.edu
    gpg: requesting key A9EFD09E from hkp server pgp.mit.edu
    gpg: key 437D05B5: "Ubuntu Archive Automatic Signing Key <ftpmaster@ubuntu.com>" 23 new signatures
    gpg: key FBB75451: "Ubuntu CD Image Automatic Signing Key <cdimage@ubuntu.com>" 28 new signatures
    gpg: key 4BD6EC30: "Puppet Labs Release Key (Puppet Labs Release Key) <info@puppetlabs.com>" not changed
    gpg: Total number processed: 3
    gpg:              unchanged: 2
    gpg:         new signatures: 51
    gpg: no ultimately trusted keys found
