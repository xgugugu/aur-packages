#!/bin/bash

build() {
    HASH=$(git rev-parse --short HEAD)
    ID="$1@$HASH"
    if grep -q "$ID" ../VERSION.txt; then
        echo "$ID" >>"../dist/VERSION.txt"
    else
        makepkg -sf --noconfirm &&
            pacman -U --noconfirm ./*.pkg.tar.zst &&
            mv ./*.pkg.tar.zst "../dist/$1.pkg.tar.zst" &&
            echo "$ID" >>"../dist/VERSION.txt"
    fi
}

wget -O ./VERSION.txt https://github.com/xgugugu/aur-packages/releases/download/x86_64/VERSION.txt
mkdir dist
(cd dist && wget -O ./xgugugu.db.tar.gz https://github.com/xgugugu/aur-packages/releases/download/x86_64/xgugugu.db.tar.gz)

for REPO in $1; do
    git clone "https://aur.archlinux.org/$REPO.git" &&
        (cd "$REPO" && build "$REPO") && rm -rf "$REPO"
done

wait

repo-add "./dist/xgugugu.db.tar.gz" ./dist/*.pkg.tar.zst
