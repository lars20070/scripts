# createfasta

Compiling `fasta` files for ComPIL searches from public repositories

| script | description |
| :--- | :--- |
| `metaproteome_human.sh` | download sources for human microbiome, merge into single `fasta` and remove duplicate sequences<br>using sources referenced in ComPIL 2.0 paper including MAGs |
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
| `ftp://ftp.thegpm.org/fasta/cRAP/crap.fasta` | The Global Proteome Machine (GPM)<br>common Repository of Adventitious Proteins (cRAP) |
| `ftp://ftp.ncbi.nlm.nih.gov/refseq/release/bacteria/bacteria.nonredundant*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/archaea/archaea.nonredundant*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/fungi/*.protein.faa.gz`<br>`ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/*.protein.faa.gz` | National Center for Biotechnology Information (NCBI)<br>Bacteria + Archea + Fungi + Viruses |
