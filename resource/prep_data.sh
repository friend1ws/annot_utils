#! /usr/bin/env bash

# create corresponding table for GRCh name and UCSC name

if [ ! -d ../annot_utils/data/hg19 ]
then
    mkdir -p ../annot_utils/data/hg19
fi

if [ ! -d ../annot_utils/data/hg38 ]
then
    mkdir -p ../annot_utils/data/hg38
fi

if [ ! -d ../annot_utils/data/mm10 ]
then
    mkdir -p ../annot_utils/data/mm10
fi


# for GRCh37 (hg19)
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/wgEncodeGencodeBasicV19.txt.gz 
mv refGene.txt.gz ../annot_utils/data/hg19
mv wgEncodeGencodeBasicV19.txt.gz ../annot_utils/data/hg19

# for branch point (currently just for hg19)
# wget http://genome.cshlp.org/content/suppl/2014/12/16/gr.182899.114.DC1/Supplemental_DataS2.bed.gz

zcat MercerEtAl2015/Supplemental_DataS2.bed.gz | sort -k1,1 -k2,2n - | bgzip -c > branchpoint_mercer.bed.gz
zcat MercerEtAl2015/Supplemental_DataS2.bed.gz | awk '{OFS="\t"; gsub("chr","",$1); print $0}' - | sort -k1,1 -k2,2n - | bgzip -c > branchpoint_mercer.grc.bed.gz
tabix -p bed branchpoint_mercer.bed.gz
tabix -p bed branchpoint_mercer.grc.bed.gz
mv branchpoint_mercer.bed.gz ../annot_utils/data/hg19
mv branchpoint_mercer.bed.gz.tbi ../annot_utils/data/hg19
mv branchpoint_mercer.grc.bed.gz ../annot_utils/data/hg19
mv branchpoint_mercer.grc.bed.gz.tbi ../annot_utils/data/hg19

# for branch point (currently just for hg19)
awk -F ',' 'NR>1 {OFS="\t"; $5 = $1 "_" $2 "_" $3 "_" $11; $2 = $2 - 1; print $1,$2,$3,$5,"0",$4}' SignalEtAl2016/gencode_v19_branchpoints.csv | \
    sort -k1,1 -k3,3n - | bgzip -c > branchpoint_signal.bed.gz
awk -F ',' 'NR>1 {OFS="\t"; $5 = $1 "_" $2 "_" $3 "_" $11; gsub("chr","",$1); $2 = $2 - 1; print $1,$2,$3,$5,"0",$4}' SignalEtAl2016/gencode_v19_branchpoints.csv | \
    sort -k1,1 -k3,3n - | bgzip -c > branchpoint_signal.grc.bed.gz
tabix -p bed branchpoint_signal.bed.gz
tabix -p bed branchpoint_signal.grc.bed.gz
mv branchpoint_signal.bed.gz ../annot_utils/data/hg19
mv branchpoint_signal.bed.gz.tbi ../annot_utils/data/hg19
mv branchpoint_signal.grc.bed.gz ../annot_utils/data/hg19
mv branchpoint_signal.grc.bed.gz.tbi ../annot_utils/data/hg19


# for simple repeat
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/hg19

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/hg38

wget http://hgdownload.soe.ucsc.edu/goldenPath/mm10/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/mm10


# for GRCh38 (hg38)
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg38/database/wgEncodeGencodeBasicV24.txt.gz
mv refGene.txt.gz ../annot_utils/data/hg38
mv wgEncodeGencodeBasicV24.txt.gz ../annot_utils/data/hg38

# for GRCm38 (mm10)
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/refGene.txt.gz
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/database/wgEncodeGencodeBasicVM9.txt.gz  
mv refGene.txt.gz ../annot_utils/data/mm10
mv wgEncodeGencodeBasicVM9.txt.gz ../annot_utils/data/mm10




