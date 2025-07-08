#!/bin/bash
# A script for preparing binaries for version release of Maple Cursors, by Abdulkaiz Khatri

key="Maple"
comment="The maple cursors."

# Cleanup old builds
rm -rf themes bin &&
ctgen build.toml -p x11 &&

# Building maple Windows binaries
ctgen build.toml -p windows -s 16 -d "bitmaps/${key}" -n "${key}-Small" -c "$comment" &&
ctgen build.toml -p windows -s 24 -d "bitmaps/${key}" -n "${key}-Regular" -c "$comment" &&
ctgen build.toml -p windows -s 32 -d "bitmaps/${key}" -n "${key}-Large" -c "$comment" &&
ctgen build.toml -p windows -s 48 -d "bitmaps/${key}" -n "${key}-Extra-Large" -c "$comment" &&

# Compressing Binaries
mkdir -p bin &&
cd themes &&

tar -czvf "../bin/${key}.tar.gz" "${key}" &&
zip -rv "../bin/${key}-Windows.zip" "${key}-Small-Windows" "${key}-Regular-Windows" "${key}-Large-Windows" "${key}-Extra-Large-Windows" &&

cd ..
