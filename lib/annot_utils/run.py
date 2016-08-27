#! /usr/bin/env python

import gene
import chr_name

def gene_main(args):

    ucsc2grc = None
    if args.is_grc:
        ucsc2grc = chr_name.make_ucsc2grc(args.genome_id)

    gene.make_gene_info(args.ref_gene_txt, args.output_path, "ref", ucsc2grc)



def exon_main(args):

    ucsc2grc = chr_name.make_ucsc2grc("hg38")
    for ucsc in sorted(ucsc2grc):
        print ucsc + '\t' + ucsc2grc[ucsc]



