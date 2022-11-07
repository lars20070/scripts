#!/bin/bash

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"mouse/"

cd $homedir || exit 2

# download UniProt archaea reference proteome
wget -r --accept fasta.gz,dat.gz --reject additional.dat.gz,DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/

# flatten directory structure, unzip and concatenate
# find ./ -mindepth 2 -type f -exec cp '{}' Eukaryota \;
# gzip -d ./Eukaryota/*.gz
# cat ./Eukaryota/*.fasta > uniprot_reference_fungi.fasta
