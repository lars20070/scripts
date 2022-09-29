#!/bin/bash

# simple line + word + characters count
cat uniprot.fasta | parallel --pipe wc
