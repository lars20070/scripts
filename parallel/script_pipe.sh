#!/bin/bash

# simple line + word + characters count
# block size 1 MB by default
< uniprot.fasta parallel --pipe wc

# block size of 5 MB
# < uniprot.fasta parallel --pipe --block 5M wc
cat uniprot.fasta | parallel --pipe --block 5M wc
