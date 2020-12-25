sp - manager for suckless software
==========================================

> (simple|suckless|source) (packages|patches|plugins)

Automate getting patches for suckless software. For the relevant program, opens
the wiki page for each patch available on [suckless.org](suckless.org) in
`${PAGER:-less}`. After exiting the pager, displays a numbered list of
available patch versions. Enter the number next to the version you want. That
file is copied to `patches/` (any non-matching input will result in no
action).

Depends on [glow](https://github.com/charmbracelet/glow) to render Markdown.

Hardcoded in the initial version to only work for
[st](https://st.suckless.org/) and copy patches to `$(pwd)/patches`. These
values can be edited manually in the first few lines of the script for now.
(lol suckless philosophy = u hav 2 edit src code to do anything, amirite?)

Please submit pull requests to make my code better so I can avoid doing the
work while taking credit for it :)
