#!/bin/bash

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"mouse/"

cd $homedir || exit 2

# download UniProt archaea reference proteome
# wget -r --accept fasta.gz --reject DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Viruses/

# flatten directory structure, unzip and concatenate
for dir in ./Viruses/*/
do
     cp $dir/*.fasta.gz ./Viruses 
done
gzip -d ./Viruses/*.gz
cat ./Viruses/*.fasta > uniprot_reference_viruses.fasta
