#!/bin/bash

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"mouse/"

cd $homedir || exit 2

taxon=Archaea

# download all Archaea UniProt reference proteomes
# wget -r --accept fasta.gz --reject DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/"$taxon"/

# flatten directory structure, unzip and concatenate
for dir in ./"$taxon"/*/
do
     cp "$dir"/*.fasta.gz ./"$taxon" 
done
gzip -d ./"$taxon"/*.gz
cat ./"$taxon"/*.fasta > uniprot_reference_$taxon.fasta
# rm -fr ./"$taxon"
