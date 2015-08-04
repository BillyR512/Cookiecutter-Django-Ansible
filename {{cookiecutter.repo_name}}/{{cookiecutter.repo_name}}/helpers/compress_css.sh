#!/bin/bash

# Use YUI compressor to compress css files in static/css

FILES=../static/css/*

for f in $FILES
do
    if [[ ! $f =~ \.min.css$ ]]; then
        ./asset_merge_and_compress.sh main $f
    else
        echo "file $f not compressed"
    fi
done

