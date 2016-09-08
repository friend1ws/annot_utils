#! /usr/bin/env python

import gene, exon, junction

def gene_main(args):

    gene.make_gene_info(args.output_path, args.gene_model, args.genome_id, args.is_grc, args.add_ref_id)


def exon_main(args):

    exon.make_exon_info(args.output_path, args.gene_model, args.genome_id, args.is_grc, args.add_ref_id)


def junction_main(args):

    junction.make_junction_info(args.output_path, args.genome_id, args.is_grc, args.donor_size, args.acceptor_size)


