---
title: Bash prompt colorization and line wrapping
author: shuff
layout: default
---
So, I'm not going to tell you how to colorize your Bash prompt, because [other have already done so](http://www.faqs.org/docs/Linux-HOWTO/Bash-Prompt-HOWTO.html#AEN343).  However, I want to call your attention to one detail of colorization that may not be immediately obvious: you need to enclose your non-printing escape sequences in `\]` and `\]`, otherwise they will screw up Bash's line wrapping calculations.

In particular, if after colorizing your prompt, you notice that long lines wrap back to the first column and start overwriting what you had previously typed, instead of breaking to the next line, then you probably have [this problem](http://superuser.com/questions/223132/how-do-i-fix-my-colour-bash-prompt-wrapping).
