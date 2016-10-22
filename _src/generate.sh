#!/bin/sh
for source_file in *.md; do
    pandoc -s -S --toc -c style.css -o ../"${source_file%%.*}.html" "${source_file}"
done
