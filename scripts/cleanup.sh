#!/bin/bash

echo "Remove the syri_env environment."
conda remove --name syri_env --all

echo "Remove all unnecessary files."
rm plotsr.log
rm syri.out syri.vcf syri.log syri.summary
rm out.filtered.coords out.filtered.delta out.delta
rm reference query
rm ../genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered ../genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered
