# createfasta

Compiling `fasta` files for ComPIL searches from public repositories

| script | description |
| :--- | :--- |
| `metaproteome_human_compil2.sh` | download sources for human microbiome, merge into single `fasta` and remove duplicate sequences<br>using sources referenced in ComPIL 2.0 paper including MAGs |
| `metaproteome_human.sh` | download sources for human microbiome, merge into single `fasta` and remove duplicate sequences<br>using exclusively UniProt reference proteomes, no MAGs |
| `metaproteome_mouse.sh` | download sources for mouse microbiome, merge into single `fasta` and remove duplicate sequences<br>using exclusively UniProt reference proteomes, no MAGs |
| `reference_proteome_archaea.sh` | download reference proteome for archaea from UniProt (combination of Swiss-Prot and TrEMBL)|
| `reference_proteome_bacteria.sh` | download reference proteome for bacteria from UniProt (combination of Swiss-Prot and TrEMBL)|
| `reference_proteome_fungi.sh` | download reference proteome for fungi from UniProt (combination of Swiss-Prot and TrEMBL)|
| `reference_proteome_viruses.sh` | download reference proteome for viruses from UniProt (combination of Swiss-Prot and TrEMBL)|

&nbsp;

## `fasta` file for human gut microbiome

| download link | description |
| :--- | :--- |
| `http://downloads.hmpdacc.org/data/reference_genomes/body_sites/Gastrointestinal_tract.pep.fsa` | NIH Human Microbiome Project (HMP)<br>Data Analysis and Coordination Center (DACC)<br>gastrointestinal tract |
| `http://www.bork.embl.de/~arumugam/Qin_et_al_2010/frequent_microbe_proteins.fasta.gz` | Peer Bork Group, EMBL Heidelberg |
| `ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz`<br>`ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz` | complete UniProt<br>(SwissProt and TrEMBL) |
| `ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta` | The Global Proteome Machine (GPM)<br>common Repository of Adventitious Proteins (cRAP) |
| `ftp://ftp.ncbi.nlm.nih.gov/refseq/release/bacteria/bacteria.nonredundant*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/archaea/archaea.nonredundant*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/fungi/*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/*.protein.faa.gz` | National Center for Biotechnology Information (NCBI)<br>Bacteria + Archea + Fungi + Viruses |
| `ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/mgnify_genomes/human-gut/v2.0/protein_catalogue` | Unified Human Gastrointestinal Genome (UHGG) v2.0 |
| `http://data.gtdb.ecogenomic.org/releases/latest/genomic_files_all/ar53_marker_genes_all.tar.gz`<br>`https://data.gtdb.ecogenomic.org/releases/latest/genomic_files_all/bac120_marker_genes_all.tar.gz` | Genome Taxonomy Database (GTDB) |
| `ftp://ftp.ebi.ac.uk/pub/databases/metagenomics/genome_sets/gut_phage_database/GPD_proteome.faa.gz` | Gut Phage Database (GPD) |

&nbsp;

## `fasta` file for mouse gut microbiome

| download link | description |
| :--- | :--- |
| `ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota/UP000000589/UP000000589_10090.fasta.gz` | mouse reference proteome from UniProt |
| `ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Archaea/`<br>`ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Bacteria/`<br>`ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Eukaryota`<br>`ftp://ftp.uniprot.org/pub/databases/uniprot/knowledgebase/reference_proteomes/Viruses/` | reference proteomes for archaea, bacteria, fungi and viruses from UniProt |
| `ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta` | The Global Proteome Machine (GPM)<br>common Repository of Adventitious Proteins (cRAP) |
| `http://lotus1.gwdg.de/mpg/mmbc/maxquant_input.nsf/7994124a4298328fc125748d0048fee2/\$FILE/contaminants.fasta` | contaminants from MaxQuant |


## database sizes

reference table for typical database sizes

| database | number of protein sequence entries | size fasta file |
| :--- | ---: | ---: |
| UniProtKB/Swiss-Prot Mouse | 17,127 | 11.6 MB |
| UniProtKB/TrEMBL Mouse | 38,184 | 32.6 MB |
| UniProtKB/ReferenceProteome Mouse | 21,986 | 14.1 MB |
| UniProtKB/ReferenceProteome Mouse additional (i.e. isoforms and variants) | 41,655 | 22.5 MB |
| UniProtKB/Swiss-Prot Human | 20,385 | 13.6 MB |
| UniProtKB/TrEMBL Human | 60,196 | 71.5 MB |
| UniProtKB/ReferenceProteome Human | 20,607 | 13.7 MB |
| UniProtKB/ReferenceProteome Human additional (i.e. isoforms and variants) | 81,965 | 41.5 MB |
| UniProtKB/Swiss-Prot E. coli K12 | 4,529 | 1.9 MB |
| UniProtKB/TrEMBL E. coli K12 | 105 | 32 KB |
| UniProtKB/ReferenceProteome E. coli K12 | 4,448 | 1.9 MB |
| UniProtKB/Swiss-Prot all | 568,363 | 282.5 MB |
| UniProtKB/TrEMBL all | 229,928,140 | 111.5 GB |
| UniProtKB/ReferenceProteome Archaea | 803,432 | 340.6 MB |
| UniProtKB/ReferenceProteome Bacteria | 33,058,808 | 15.1 GB |
| UniProtKB/ReferenceProteome Fungi | 9,573,358 | 5.7 GB |
| UniProtKB/ReferenceProteome Viruses | 572,357 | 203.4 MB |
| metaproteome Mouse (complete database for ComPIL searches, UniProt reference proteomes only) | 44,030,302 | 21.36 GB |

