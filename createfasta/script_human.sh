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
cd ncbi || exit 2
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/bacteria/bacteria.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/archaea/archaea.nonredundant*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/fungi/*.protein.faa.gz
# wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/*.protein.faa.gz
gzip -d ./*glob*
