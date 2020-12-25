#!/bin/sh

set -e

cache=${XDG_CACHE_HOME:-~/.cache}
pkgname=st
pkgver=4ef0cbd
pkgdir=$(pwd)

cd "$cache"
[ ! -d sites ] && git clone git://git.suckless.org/sites

cd sites/ && git pull >/dev/null 2>&1

cd "$pkgname".suckless.org/patches
mkdir "$pkgdir"/patches 2>/dev/null || true
for patchdir in *; do
	glow -p "$patchdir"/index.md
	patchlist=
	i=1
	for patch in $(find "$patchdir" -name '*.diff'); do
		patchlist="$patchlist$i $patch\n"
		i=$((i+1))
	done
	printf "$patchlist"
	read -r patchver
	patchpath=$(printf "$patchlist" | grep "^$patchver " | sed "s/^$patchver //")
	[ "$patchpath" ] && cp -t "$pkgdir"/patches "$patchpath" 
done
