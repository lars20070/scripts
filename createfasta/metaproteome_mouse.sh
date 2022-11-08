#!/bin/bash

# shellcheck disable=SC1091

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# directory for specific database
homedir=$databasedir"mouse/"

cd $homedir || exit 2

# # download contaminants
# # from The Global Proteome Machine (GPM) common Repository of Adventitious Proteins (cRAP)
# wget ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta -O contaminants_crap.fasta
# # from MaxQuant
# wget "http://lotus1.gwdg.de/mpg/mmbc/maxquant_input.nsf/7994124a4298328fc125748d0048fee2/\$FILE/contaminants.fasta" -O contaminants_maxquant.fasta

# # download UniProt mouse reference proteome
# # The reference proteome is a combination of both Swiss-Prot and TrEMBL protein seqiences. https://www.uniprot.org/help/reference_proteome
# wget "https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/UP000000589/UP000000589_10090.fasta.gz" -O uniprot_reference_Mouse.fasta.gz
# gzip -d uniprot_reference_Mouse.fasta.gz

# # download UniProt additional mouse reference proteome
# # 'additional' refers to isoforms and variants. https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/reference_proteomes/README
# wget "https://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/UP000000589/UP000000589_10090_additional.fasta.gz" -O uniprot_reference_Mouse_additional.fasta.gz
# gzip -d uniprot_reference_Mouse_additional.fasta.gz

# # download UniProt reference proteomes for archaea, bacteria, fungi and viruses
# source ./reference_proteome_archaea.sh
# source ./reference_proteome_bacteria.sh
# source ./reference_proteome_fungi.sh
# source ./reference_proteome_viruses.sh

# # combine all sources
# cat uniprot_reference_Mouse.fasta uniprot_reference_Archaea.fasta uniprot_reference_Bacteria.fasta uniprot_reference_Fungi.fasta uniprot_reference_Viruses.fasta contaminants_crap.fasta contaminants_maxquant.fasta > combined.fasta

# remove line breaks
# write header and sequence in a single row separated by ">>>"
# if line starts with > then print the line (i.e. the header) and set next-line-character to \n for later
# if line does not start with > then print the next-line-character, print the line, print the ">>>" separator and set next-line-character to empty for later
awk '!/^>/ { printf "%s", $0; n = "\n" } 
/^>/ { printf "%s%s%s", n, $0, ">>>"; n = "" }
END { printf "%s", n }
' combined.fasta > combined_temp.fasta

# make second column unique
# store header in m with seqeunce as index
# then finally print m
awk 'BEGIN{FS=">>>"}{m[$2]=$1}END{for(i in m)print m[i],i}' combined_temp.fasta > combined_temp2.fasta

# add line breaks
seqkit seq -w 60 ucombined_temp2.fasta > combined_unique.fasta

# remove temporary files
rm ./*glob*temp.fasta
rm ./*glob*temp2.fasta

