#!/bin/bash

taxon=Archaea

# download all Archaea UniProt reference proteomes
wget -r --accept fasta.gz --reject DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/"$taxon"/

# flatten directory structure, unzip and concatenate
for dir in ./"$taxon"/*/
do
     cp "$dir"/*.fasta.gz ./"$taxon" 
done
gzip -d ./"$taxon"/*.gz
cat ./"$taxon"/*.fasta > uniprot_reference_$taxon.fasta
rm -fr ./"$taxon"
