#!/bin/bash
outputfile="$3"
tblastn -query "$1" -subject "$2" -out temp.txt -task tblastn-fast -outfmt "6 qseqid sseqid pident length qlen" 
awk '$3 > 30 && $4 / $5 > 0.9' temp.txt > "$outputfile"
grep -c . "$outputfile"
