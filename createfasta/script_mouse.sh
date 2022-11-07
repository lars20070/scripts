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

# rm -fr *

# # download contaminants
# # from The Global Proteome Machine (GPM) common Repository of Adventitious Proteins (cRAP)
# wget ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta -O contaminants_crap.fasta
# # from MaxQuant
# wget "http://lotus1.gwdg.de/mpg/mmbc/maxquant_input.nsf/7994124a4298328fc125748d0048fee2/\$FILE/contaminants.fasta" -O contaminants_maxquant.fasta

# # download UniProt mouse reference proteome
# # The reference proteome is a combination of both Swiss-Prot and TrEMBL protein seqiences. https://www.uniprot.org/help/reference_proteome
# wget "https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/UP000000589/UP000000589_10090.fasta.gz" -O uniprot_reference_mouse.fasta.gz
# gzip -d uniprot_reference_mouse.fasta.gz

# # download UniProt additional mouse reference proteome
# # 'additional' refers to isoforms and variants. https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/README
# wget "https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/UP000000589/UP000000589_10090_additional.fasta.gz" -O uniprot_reference_mouse_additional.fasta.gz
# gzip -d uniprot_reference_mouse_additional.fasta.gz

# download UniProt bacteria reference proteome
wget -r --accept "*.fasta.gz" --reject "*_DNA.fasta.gz" —-no-parent -nH --cut-dirs 5 ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Bacteria/

# flatten directory structure and unzip
# find ./ -mindepth 2 -type f -exec cp '{}' Bacteria \;
# gzip -d ./Bacteria/*.gz
# cat ./Bacteria/*.fasta > uniprot_reference_bacteria.fasta
