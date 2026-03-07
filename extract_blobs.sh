#!/bin/bash
SRC=~/super_extracted
DST=~/device_tree/vendor/tecno/KM7k/proprietary

mkdir -p $DST

for file in $(cat proprietary-files.txt); do
    if [ -f "$SRC/$file" ]; then
        echo "✅ Copying: $file"
        mkdir -p "$DST/$(dirname $file)"
        cp "$SRC/$file" "$DST/$file"
    else
        # Subukan nating hanapin sa system folder ng kitchen
        if [ -f "$SRC/system/$file" ]; then
             echo "✅ Found in system subfolder: $file"
             mkdir -p "$DST/$(dirname $file)"
             cp "$SRC/system/$file" "$DST/$file"
        else
             echo "❌ Not found: $file"
        fi
    fi
done
