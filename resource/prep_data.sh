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

<<_COMMENT_OUT_
# for simple repeat
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg19/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/hg19

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/hg38

wget http://hgdownload.soe.ucsc.edu/goldenPath/mm10/database/simpleRepeat.txt.gz
mv simpleRepeat.txt.gz ../annot_utils/data/mm10
_COMMENT_OUT_


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




