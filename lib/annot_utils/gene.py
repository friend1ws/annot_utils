#! /usr/bin/env python

import sys, gzip, subprocess
# import pysam


def make_gene_info(input_file, output_file, gene_model):

    hout = open(output_file + ".unsorted.tmp", 'w')
    with gzip.open(input_file, 'r') as hin:
        for line in hin:
            F = line.rstrip('\n').split('\t')

            chr = F[2]
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
                # gene_print_name = symbol
                gene_print_name = symbol + '(' + gene_id + ')'
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


