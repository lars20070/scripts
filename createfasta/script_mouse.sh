#!/bin/bash

# installation wget
# brew install wget

# installation IBM Aspera CLI
# sudo gem install websocket-client-simple -v 0.3.1
# sudo gem install aspera-cli
# sudo gem update aspera-cli
# which ascli
# ascli conf check_update

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"mouse/"

cd $homedir || exit 2

# download contaminants
# from The Global Proteome Machine (GPM) common Repository of Adventitious Proteins (cRAP)
# wget ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta -O contaminants_crap.fasta
# from from MaxQuant
# wget "http://lotus1.gwdg.de/mpg/mmbc/maxquant_input.nsf/7994124a4298328fc125748d0048fee2/\$FILE/contaminants.fasta" -O contaminants_maxquant.fasta

# download complete phyla
# National Institute of Health (NIH)
# National Library of Medecine (NLM)
# National Center for Biotechnology Information (NCBI)
# Bacteria + Archea + Fungi + Viruses
rm -fr ncbi
mkdir ncbi
cd ncbi || exit 2
wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/bacteria/bacteria.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/archea/archea.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/fungi/*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/*.protein.faa.gz
