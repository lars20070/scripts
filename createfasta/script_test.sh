#!/bin/bash

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"ComPIL2.0/"

cd $homedir || exit 2

# # remove line breaks 
# # if line starts with > then print the line and set next-line-character to \n for later
# # if line does not start with > then print the next-line-character, print the line and set next-line-character to empty for later
# awk '!/^>/ { printf "%s", $0; n = "\n" } 
# /^>/ { print n $0; n = "" }
# END { printf "%s", n }
# ' combined.fasta > combined_2.fasta



# # remove line breaks
# # if line starts with > then print the line (i.e. header) and set next-line-character to \n for later
# # if line does not start with > then print the next-line-character, print the line, print the ">>>" separator and set next-line-character to empty for later
# awk '!/^>/ { printf "%s", $0; n = "\n" } 
# /^>/ { printf "%s%s%s", n, $0, ">>>"; n = "" }
# END { printf "%s", n }
# ' combined_reverse.fasta > combined_reverse_temp.fasta

# make second column unique
# store header in m with seqeunce as index
# then finally print m
# awk 'BEGIN{FS=">>>"}{m[$2]=$1}END{for(i in m)print m[i],i}' combined_reverse_temp.fasta > combined_reverse_unique.fasta
# an alternative with less memory footprint
#sed -e s/\>\>\>/\>/g combined_reverse_temp.fasta> combined_reverse_temp2.fasta
sort -T~/tmp -u -t">" -k3 combined_reverse_temp2.fasta > combined_reverse_temp3.fasta



# move every second row to a new column
# awk '{printf "%s%s",$0,NR%2?"\t":RS}' combined_2.fasta > combined_3.fasta

# printf does not print end-of-line character (unlike print)
# print first the line itself $0
# then print either a column separator >>> or next line separator RS 

# explanation: %s prints arguments as string
# printf "Hello %s, I'm %s" Sven Olga
# #=> "Hello Sven, I'm Olga

# make second column unique
# store header in m with seqeunce as index
# then finally print m
# awk 'BEGIN{FS="\t"}{m[$2]=$1}END{for(i in m)print m[i],i}' uniprot_out2.fasta > uniprot_out3.fasta

# add line breaks
#seqkit seq -w 140 uniprot_out.fasta > uniprot_out2.fasta












# head -n 10000 combined.fasta | tail -n 100
# wc -l combined.fasta
# grep -o -i ">" combined.fasta | wc -l




# cd ~/Desktop || exit 2
# awk '{ print $0 }' uniprot-ecoli.fasta
# awk -F'|' '$1 == ">CON" { print $0 }' uniprot-ecoli.fasta | sort
# awk '/ELVIS/' combined.fasta

# awk "NR==1 {print;exit}" uniprot-ecoli.fasta
# bioawk -c fastx '{ print $name, length($seq) }' uniprot-ecoli.fasta
# grep -v ">" uniprot-ecoli.fasta | sort -u > uniprot-ecoli-unique.fasta

