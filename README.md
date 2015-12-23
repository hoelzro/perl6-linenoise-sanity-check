# Perl 6 Linenoise Sanity Check

tl;dr - Keep Linenoise going

[Rakudo](http://rakudo.org/), a Perl 6 implementation, uses Linenoise for tab
completions if installed.  However, this is not reflected in the test suite
(it would be difficult to test, and is somewhat beyond the suite's scope).
In addition, the delicate balance of module loading, NativeCall, and the
compiler API means that Linenoise occasionally will fail to load and provide
tab completions if installed.  This repository is designed as a rudimentary
early warning system for me (the Linenoise author and maintainer) to make
sure Linenoise works.
