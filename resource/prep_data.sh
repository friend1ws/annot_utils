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
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/wgEncodeGencodeBasicV19.txt.gz 
mv GCF_000001405.13.assembly.txt ../lib/annot_utils/data/hg19
mv refGene.txt.gz ../lib/annot_utils/data/hg19
mv wgEncodeGencodeBasicV19.txt.gz ../lib/annot_utils/data/hg19

# for branch point (currently just for hg19)
wget http://genome.cshlp.org/content/suppl/2014/12/16/gr.182899.114.DC1/Supplemental_DataS2.bed.gz
zcat Supplemental_DataS2.bed.gz | sort -k1,1 -k2,2n - | bgzip -c > branchpoint_mercer.bed.gz
zcat Supplemental_DataS2.bed.gz | awk '{OFS="\t"; gsub("chr","",$1); print $0}' - | sort -k1,1 -k2,2n - | bgzip -c > branchpoint_mercer.grc.bed.gz
tabix -p bed branchpoint_mercer.bed.gz
tabix -p bed branchpoint_mercer.grc.bed.gz
mv branchpoint_mercer.bed.gz ../lib/annot_utils/data/hg19
mv branchpoint_mercer.bed.gz.tbi ../lib/annot_utils/data/hg19
mv branchpoint_mercer.grc.bed.gz ../lib/annot_utils/data/hg19
mv branchpoint_mercer.grc.bed.gz.tbi ../lib/annot_utils/data/hg19
rm -rf Supplemental_DataS2.bed.gz

# for GRCh38 (hg38)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001405.26.assembly.txt
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/wgEncodeGencodeBasicV24.txt.gz
mv GCF_000001405.26.assembly.txt ../lib/annot_utils/data/hg38
mv refGene.txt.gz ../lib/annot_utils/data/hg38
mv wgEncodeGencodeBasicV24.txt.gz ../lib/annot_utils/data/hg38

# for GRCm38 (mm10)
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/All/GCF_000001635.20.assembly.txt
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/wgEncodeGencodeBasicVM9.txt.gz  
mv GCF_000001635.20.assembly.txt ../lib/annot_utils/data/mm10
mv refGene.txt.gz ../lib/annot_utils/data/mm10
mv wgEncodeGencodeBasicVM9.txt.gz ../lib/annot_utils/data/mm10




