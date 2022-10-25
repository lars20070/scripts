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
homedir=$databasedir"human/"

cd $homedir || exit 2

# download reference dataset
# NIH Human Microbiome Project (HMP)
# Data Analysis and Coordination Center (DACC)
# *.fsa -> fragment analysis data file from DNA sequencer
# wget http://downloads.hmpdacc.org/data/reference_genomes/body_sites/Gastrointestinal_tract.pep.fsa -O reference_hmp_dacc_gastrointestinal_tract.fasta

# download reference dataset
# EMBL Heidelberg, Peer Bork Group
# Qin, J. et al. A human gut microbial gene catalogue established by metagenomic sequencing. Nature 464, 59–65 (2010).
# https://www.nature.com/articles/nature08821
# wget http://www.bork.embl.de/~arumugam/Qin_et_al_2010/frequent_microbe_proteins.fasta.gz -O reference_embl_bork_human_gut.fasta.gz
# gzip -d reference_embl_bork_human_gut.fasta.gz

# download complete UniProt
# SwissProt (manually reviewed) + TrEMBL (computationally analysed and annotated)
# no isoforms i.e. no splice variants
# wget ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz -O uniprot_sprot.fasta.gz
# gzip -d uniprot_sprot.fasta.gz
# wget ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz -O uniprot_trembl.fasta.gz
# gzip -d uniprot_trembl.fasta.gz

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
# rm -fr ncbi
# mkdir ncbi
# cd ncbi || exit 2
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/bacteria/bacteria.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/archaea/archaea.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/fungi/*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/*.protein.faa.gz
# gzip -d ./*glob*
# cd $homedir || exit 2
# cat ./ncbi/*.faa > ncbi_bacteria_archaea_fungi_viral.fasta

# Unified Human Gastrointestinal Genome (UHGG) v2.0
# released in MGnify (formerly EBI Metagenomics)
# https://www.ebi.ac.uk/about/news/updates-from-data-resources/uhgg-v20-released-mgnify/
# https://www.ebi.ac.uk/metagenomics/genome-catalogues/human-gut-v2-0
# protein coding sequences clustered at 100%, 95%, 90% and 50% amino acid identity
# rm -fr uhgg
# mkdir uhgg
# cd uhgg || exit 2
# wget ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0/protein_catalogue/uhgp-50.tar.gz
# wget ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0/protein_catalogue/uhgp-90.tar.gz
# wget ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0/protein_catalogue/uhgp-95.tar.gz
# wget ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0/protein_catalogue/uhgp-100.tar.gz
# tar -zxvf ./uhgp-50.tar.gz
# tar -zxvf ./uhgp-90.tar.gz
# tar -zxvf ./uhgp-95.tar.gz
# tar -zxvf ./uhgp-100.tar.gz
# cd $homedir || exit 2
# cat ./uhgg/uhgp-50/uhgp-50.faa ./uhgg/uhgp-90/uhgp-90.faa ./uhgg/uhgp-95/uhgp-95.faa ./uhgg/uhgp-100/uhgp-100.faa > uhgg.fasta

# Genome Taxonomy Database (GTDB)
rm -fr gtdb
mkdir gtdb
cd gtdb || exit 2
wget https://data.gtdb.ecogenomic.org/releases/latest/genomic_files_reps/ar53_marker_genes_all.tar.gz
wget https://data.gtdb.ecogenomic.org/releases/latest/genomic_files_reps/bac120_marker_genes_all.tar.gz
# tar -zxvf ./*.tar.gz
# cd $homedir || exit 2

# Gut Phage Database (GPD)
# wget ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/genome_sets/gut_phage_database/GPD_proteome.faa.gz -O gpd.faa.gz


# combine all sources
# cat reference_hmp_dacc_gastrointestinal_tract.fasta reference_embl_bork_human_gut.fasta uniprot_sprot.fasta uniprot_trembl.fasta contaminants_crap.fasta ncbi_bacteria_archaea_fungi_viral.fasta > combined.fasta

# remove line breaks
# write header and sequence in a single row separated by ">>>"
# if line starts with > then print the line (i.e. the header) and set next-line-character to \n for later
# if line does not start with > then print the next-line-character, print the line, print the ">>>" separator and set next-line-character to empty for later
# awk '!/^>/ { printf "%s", $0; n = "\n" } 
# /^>/ { printf "%s%s%s", n, $0, ">>>"; n = "" }
# END { printf "%s", n }
# ' combined.fasta > combined_temp.fasta

# make second column unique
# store header in m with seqeunce as index
# then finally print m
# awk 'BEGIN{FS=">>>"}{m[$2]=$1}END{for(i in m)print m[i],i}' combined_temp.fasta > combined_temp2.fasta

# add line breaks
# seqkit seq -w 60 ucombined_temp2.fasta > combined_unique.fasta

# remove temporary files
# rm ./*glob*temp.fasta
# rm ./*glob*temp2.fasta

