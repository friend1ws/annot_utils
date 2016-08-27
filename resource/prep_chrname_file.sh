#! /usr/bin/env bash

# create corresponding table for GRCh name and UCSC name

# for GRCh37 (hg19)
rm -rf GCF_000001405.13.assembly.txt
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.13.assembly.txt

# for GRCh38 (hg38)
# rm -rf GCF_000001405.31.assembly.txt
# wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.31.assembly.txt
rm -rf GCF_000001405.26.assembly.txt
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.26.assembly.txt

# for GRCm38 (mm10)
rm -rf GCF_000001635.20.assembly.txt
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001635.20.assembly.txt

mv GCF_000001405.13.assembly.txt ../lib/annot_utils/data
mv GCF_000001405.26.assembly.txt ../lib/annot_utils/data
mv GCF_000001635.20.assembly.txt ../lib/annot_utils/data

