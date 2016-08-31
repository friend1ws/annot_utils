#! /usr/bin/env python

import sys, gzip, subprocess, pkg_resources 
# import pysam
import chr_name

def make_gene_info(output_file, gene_model, genome_id, is_grc, add_ref_id):

    # create UCSC to GRC chr name corresponding table
    ucsc2grc = None
    if is_grc:
        ucsc2grc = chr_name.make_ucsc2grc(genome_id)

    if genome_id == "hg19":
        ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg19/refGene.txt.gz")
    elif genome_id == "hg38":
        ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/hg38/refGene.txt.gz")
    elif genome_id == "mm10":
        ucsc_gene_file = pkg_resources.resource_filename("annot_utils", "data/mm10/refGene.txt.gz")
    else:
        print >> sys.stderr, "genome_id shoud be hg19, hg38 or mm10"
        sys.exit(1)

    hout = open(output_file + ".unsorted.tmp", 'w')
    with gzip.open(ucsc_gene_file, 'r') as hin:
        for line in hin:
            F = line.rstrip('\n').split('\t')

            chr = ucsc2grc[F[2]] if ucsc2grc is not None else F[2]
            gene_id = F[1]
            gene_start = F[4]
            gene_end = F[5]
            strand = F[3]
            symbol = F[12]
            exon_starts = F[9].split(',')
            exon_ends = F[10].split(',')

            """
            size = 0
            for i in range(len(exon_starts) - 1):
                size = size + int(exon_ends[i]) - int(exon_starts[i])
            """

            gene_print_name = "---"
            if gene_model == "ref":
                if add_ref_id:
                    gene_print_name = symbol + '(' + gene_id + ')'
                else:
                    gene_print_name = symbol
            elif gene_model == "ens":
                gene_print_name = gene_id
            else:
                print >> sys.stderr, "The 2nd argument should be ref or ens"
                sys.exit(1)

            key = chr + '\t' + gene_start + '\t' + gene_end
            print >> hout, key + '\t' + gene_print_name + '\t' + "0" + '\t' + strand

    hout.close()


    hout = open(output_file + ".sorted.tmp", 'w')
    subprocess.check_call(["sort", "-k1,1", "-k2,2n", "-k3,3n", output_file + ".unsorted.tmp"], stdout = hout)
    hout.close()

    hout = open(output_file, 'w')
    subprocess.check_call(["bgzip", "-f", "-c", output_file + ".sorted.tmp"], stdout = hout)
    hout.close()

    subprocess.check_call(["tabix", "-p", "vcf", output_file])


    subprocess.check_call(["rm", "-rf", output_file + ".unsorted.tmp"])
    subprocess.check_call(["rm", "-rf", output_file + ".sorted.tmp"])


