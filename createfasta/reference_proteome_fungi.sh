#!/bin/bash

taxon=Eukaryota

# download all Eukaryota UniProt reference proteomes
wget -r --accept fasta.gz,dat.gz --reject additional.dat.gz,DNA.fasta.gz,additional.fasta.gz —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/"$taxon"/

# filter for fungi proteomes, unzip fasta and concatenate
for dir in ./"$taxon"/*/
do
    gzip -d "$dir"/*.dat.gz
    if grep -q "OC   Eukaryota; Fungi" "$dir"/*.dat
    then
        cp "$dir"/*.fasta.gz ./"$taxon"
    fi 
done
gzip -d ./"$taxon"/*.gz
cat ./"$taxon"/*.fasta > uniprot_reference_Fungi.fasta
rm -fr ./"$taxon"
