#!/bin/bash

# Use YUI compressor to compress js files in static/js

FILES=../static/js/*


for f in $FILES
do
    echo $f
    if [[ ! $f =~ \.min.js$ ]]; then
        ./asset_merge_and_compress.sh main $f
    else
        echo "file $f not compressed"
    fi
done

