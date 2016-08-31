#! /usr/bin/env bash

# create corresponding table for GRCh name and UCSC name

if [ ! -d ../lib/annot_utils/data/hg19 ]
then
    mkdir -p ../lib/annot_utils/data/hg19
fi

if [ ! -d ../lib/annot_utils/data/hg38 ]
then
    mkdir -p ../lib/annot_utils/data/hg38
fi

if [ ! -d ../lib/annot_utils/data/mm10 ]
then
    mkdir -p ../lib/annot_utils/data/mm10
fi


# for GRCh37 (hg19)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.13.assembly.txt
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/ensGene.txt.gz
mv GCF_000001405.13.assembly.txt ../lib/annot_utils/data/hg19
mv refGene.txt.gz ../lib/annot_utils/data/hg19
mv ensGene.txt.gz ../lib/annot_utils/data/hg19

# for GRCh38 (hg38)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.26.assembly.txt
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/ensGene.txt.gz
mv GCF_000001405.26.assembly.txt ../lib/annot_utils/data/hg38
mv refGene.txt.gz ../lib/annot_utils/data/hg38
mv ensGene.txt.gz ../lib/annot_utils/data/hg38

# for GRCm38 (mm10)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001635.20.assembly.txt
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/ensGene.txt.gz
mv GCF_000001635.20.assembly.txt ../lib/annot_utils/data/mm10
mv refGene.txt.gz ../lib/annot_utils/data/mm10
mv ensGene.txt.gz ../lib/annot_utils/data/mm10



