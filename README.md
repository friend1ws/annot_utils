# annot_utils

[![Build Status](https://travis-ci.org/friend1ws/annot_utils.svg?branch=master)](https://travis-ci.org/friend1ws/annot_utils)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## Introduction
`annot_utils` is a software for generating tabix-indexed annotation files, which can be shared by other softwares by Y.S.
Currently, this software support only annotatioin files for hg19 (GRCh37), hg38 (GRCh38) and mm10 (GRCm38).

## Dependency

### Python

Python (>= 2.7), `pkg_resources` packages

## Software

[hstlib](http://www.htslib.org)

## Install

First, download (and unzip) the software.
```
pip install annot_utils 
```

## Update databse
Currently, `annot_utils` already store annotation files from [UCSC genome browser](https://genome.ucsc.edu) and several other sources upon installation.
If you want to update the annotation files:
```
cd annot_utils/resource
bash prep_data.sh
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

### junction

Generate annotated splicing junction bed files indexed by tabix.

```
annot_utils junction
usage: annot_utils junction [-h] 
                            [--gene_model {refseq,gencode}] [--grc]
                            [--genome_id {hg19,hg38,mm10}] [--add_ref_id]
                            junction.bed.gz
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

