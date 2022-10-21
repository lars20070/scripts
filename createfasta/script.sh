#!/bin/bash

# install wget
# brew install wget

# directory for all ComPIL databases
databasedir="/Users/lars/Projects/2022/20220628_GenentechComPIL/databases/"
# home directory
homedir=$databasedir"test/"

cd $homedir || exit 2

# download contaminants
# from The Global Proteome Machine (GPM) common Repository of Adventitious Proteins (cRAP)
# and from MaxQuant
wget ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta -O contaminants_crap.fasta
wget "http://lotus1.gwdg.de/mpg/mmbc/maxquant_input.nsf/7994124a4298328fc125748d0048fee2/\$FILE/contaminants.fasta" -O contaminants_maxquant.fasta
