#!/bin/bash
makeblastdb -in "$2" -dbtype nucl -out blastdb
tblastn -query "$1" -db blastdb -out temp -outfmt "6 pident qlen length"
awk '$1 > 30 && $3 / $2 > 0.9' temp > "$3"
grep -c . "$3"