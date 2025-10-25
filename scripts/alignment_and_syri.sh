#!/bin/bash

echo "Run the alignment on the resulting chromosomes sets."
nucmer --maxmatch -c 200 -b 500 -l 100 reference query
echo "Remove small and lower quality alignments."
delta-filter -m -i 90 -l 100 out.delta > out.filtered.delta
echo "Convert alignment information to a .tsv format as required by syri."
show-coords -THrd out.filtered.delta > out.filtered.coords
echo "Run syri."
syri -c out.filtered.coords -d out.filtered.delta -r reference -q query

echo "Create graphical representation of genomes using plotsr."
plotsr --sr syri.out --genomes genomes.txt -H 8 -W 5
echo "Create columns names in the table according to the syri documentation."
python python/syri_to_table.py

echo "Move the results to the results folder."
mkdir results
mv plotsr.pdf results/
mv syri_table.tsv results/
