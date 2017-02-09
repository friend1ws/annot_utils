# annot_utils

## Introduction
`annot_utils` is a software for generating tabix-indexed annotation files, which can be shared by other software's by Y.S.
Currently, this software support only annotatioin files for hg19 (GRCh37), hg38 (GRCh38) and mm10 (GRCm38).

## Dependency

### Python

Python (>= 2.7), `pkg_resources` packages

### Software

[hstlib](http://www.htslib.org)

## Install

First, download (and unzip) the software.
```
git clone https://github.com/friend1ws/annot_utils.git
```

Then, you need to download annotation files from [UCSC genome browser](https://genome.ucsc.edu) and several other sources.
```
cd annot_utils/resource
bash prep_data.sh
```

Then, install the software.
```
cd ../
python setup.py build install 
```


## Commands

### gene

Generate gene annotation bed flies indexed by tabix.


```
annot_utils gene [-h] 
                 [--gene_model {refseq,gencode}] [--grc]
                 [--genome_id {hg19,hg38,mm10}] [--add_ref_id]
                 gene.bed.gz
```


### exon

Generate exon annotation bed flies indexed by tabix.


```
annot_utils exon [-h] 
                 [--gene_model {refseq,gencode}] [--grc]
                 [--genome_id {hg19,hg38,mm10}] [--add_ref_id]
                 exon.bed.gz
```


### coding

Generate regional (coding, intronic, 5'UTR, 3'UTR and so on) annotation bed flies indexed by tabix.

```
annot_utils coding [-h] 
                   [--gene_model {refseq,gencode}] [--grc]
                   [--genome_id {hg19,hg38,mm10}] [--add_ref_id]
                   coding.bed.gz
```


### boundary


Generate exon intron boundary annotation files index by tabix.

```
annot_utils boundary [-h] 
                     [--genome_id {hg19,hg38,mm10}] [--grc]
                     [--donor_size donor_size]
                     [--acceptor_size acceptor_size]
                     boudary.bed.gz
```

