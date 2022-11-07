#!/bin/bash

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"mouse/"

cd $homedir || exit 2

# download UniProt archaea reference proteome
# wget -r --accept fasta.gz --reject DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Archaea/

# flatten directory structure, unzip and concatenate
for dir in ./Archaea/*/
do
     cp $dir/*.fasta.gz ./Archaea 
done
gzip -d ./Archaea/*.gz
cat ./Archaea/*.fasta > uniprot_reference_archaea.fasta
