#! /usr/bin/env python

import sys, pkg_resources

def set_ucsc_gene_file(genome_id,  gene_model):
 
    if genome_id == "hg19":
        if gene_model == "ref":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg19/refGene.txt.gz")
        elif gene_model == "ens":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg19/ensGene.txt.gz")
    elif genome_id == "hg38":
        if gene_model == "ref":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg38/refGene.txt.gz")
        elif gene_model == "ens":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg38/ensGene.txt.gz")
    elif genome_id == "mm10":
        if gene_model == "ref":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/mm10/refGene.txt.gz")
        elif gene_model == "ens":
            ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/mm10/ensGene.txt.gz")
    else:
        print >> sys.stderr, "genome_id shoud be hg19, hg38 or mm10"
        sys.exit(1)

    return(ucsc_gene_file)

