#! /usr/bin/env python

import gene
import chr_name

def gene_main(args):

    gene.make_gene_info(args.output_path, "ref", args.genome_id, args.is_grc, args.add_ref_id)


def exon_main(args):

    ucsc2grc = chr_name.make_ucsc2grc("hg38")
    for ucsc in sorted(ucsc2grc):
        print ucsc + '\t' + ucsc2grc[ucsc]



