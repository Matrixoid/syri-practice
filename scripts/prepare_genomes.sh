#!/bin/bash

echo "Extract a set of main chromosomes from the genome GCF_943734735.2_idAnoGambNW_F1_1_genomic."
seqkit grep -p "NC_064600.1" genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna >> genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered
seqkit grep -p "NC_064601.1" genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna >> genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered
seqkit grep -p "NC_064602.1" genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna >> genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered

echo "Extract a set of main chromosomes from the genome GCF_016920705.1_AcolMOP1_genomic."
seqkit grep -p "NC_053520.1" genomes/GCF_016920705.1_AcolMOP1_genomic.fna >> genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered
seqkit grep -p "NC_053521.1" genomes/GCF_016920705.1_AcolMOP1_genomic.fna >> genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered
seqkit grep -p "NC_053522.1" genomes/GCF_016920705.1_AcolMOP1_genomic.fna >> genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered

echo "Rename the chromosomes in the resulting sets so that they have the same names."
sed -i 's/NC_064600.1 Anopheles gambiae chromosome X, idAnoGambNW_F1_1, whole genome shotgun sequence/chrX/g' genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered
sed -i 's/NC_064601.1 Anopheles gambiae chromosome 2, idAnoGambNW_F1_1, whole genome shotgun sequence/chr2/g' genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered
sed -i 's/NC_064602.1 Anopheles gambiae chromosome 3, idAnoGambNW_F1_1, whole genome shotgun sequence/chr3/g' genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered
sed -i 's/NC_053520.1 Anopheles coluzzii isolate MOPTI chromosome X, AcolMOP1, whole genome shotgun sequence/chrX/g' genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered
sed -i 's/NC_053521.1 Anopheles coluzzii isolate MOPTI chromosome 2, AcolMOP1, whole genome shotgun sequence/chr2/g' genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered
sed -i 's/NC_053522.1 Anopheles coluzzii isolate MOPTI chromosome 3, AcolMOP1, whole genome shotgun sequence/chr3/g' genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered

echo "Create links to the resulting chromosomes sets."
ln -sf genomes/GCF_943734735.2_idAnoGambNW_F1_1_genomic.fna.filtered reference
ln -sf genomes/GCF_016920705.1_AcolMOP1_genomic.fna.filtered query
