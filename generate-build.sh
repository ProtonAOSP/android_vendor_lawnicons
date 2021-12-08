#!/usr/bin/env bash

res_root="overlay/packages/apps/Launcher3/res"

cd "$(dirname "$0")"

rm -fr "$res_root"
mkdir -p "$res_root"
pushd "$res_root"

ln -s ../../../../../app/src/main/res/drawable .

mkdir xml
pushd xml
ln -s ../../../../../../app/src/main/res/xml/grayscale_icon_map.xml .
popd

mkdir values
echo '<?xml version="1.0" encoding="utf-8"?>
<resources>
    <dimen name="theme_icon_size">24dp</dimen>
</resources>
' > values/dimens.xml

popd
echo "PRODUCT_PACKAGE_OVERLAYS += vendor/lawnicons/overlay" > overlay.mk
