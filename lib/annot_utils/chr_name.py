#! /usr/bin/env python

import sys, pkgutil


def make_ucsc2grc(genome_id):

    if genome_id == "hg19":
        sequence_report = pkgutil.get_data("annot_utils", "data/GCF_000001405.13.assembly.txt")
    elif genome_id == "hg38":
        sequence_report = pkgutil.get_data("annot_utils", "data/GCF_000001405.26.assembly.txt")
    elif genome_id == "mm10":
        sequence_report = pkgutil.get_data("annot_utils", "data/GCF_000001635.20.assembly.txt")
    else:
        print >> sys.stderr, "genome_id shoud be hg19, hg38 or mm10"
        sys.exit(1)


    ucsc2grch = {}
    for line in sequence_report.split('\n'):

        if line.startswith('#'): continue
        if line == "": continue
        F = line.rstrip('\n\r').split('\t')
        if F[9] == "na": continue

        if F[4].startswith('CM'):
            ucsc2grch[F[9]] = F[2]
        else:
            ucsc2grch[F[9]] = F[4]

    return ucsc2grch

