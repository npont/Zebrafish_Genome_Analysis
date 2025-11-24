# Zebrafish_Genome_Analysis
Zebrafish (Danio rerio) is a useful model organism for its easy genetic manipulation, high fecundity, external fertilization and rapid development, and nearly transparent embryo. Altho its genome has been extensively sequenced, we lack a proper comprehensive annotation. We were interested by the distribution of decylmethyltransferase (DCM) binding sites in ZF genome. In our experimental setup, the DCM is coupled to the pol-II and is thus expected to methylate the second cytosine on the binding sites of active genes. DCM motifs (=binding sites) are CCAGG and CCTGG.

This repository contains the extensive analysis of DCM binding sites in ZF genome, considering two case scenarios:
- when coupled to the polymerase, the DCM is able to methylate both strands during transcription
- the DCM is only able to methylate the strand on which the polymerase is elongating

It also include an analysis of DCM motifs in Mus Musculus genome.

It uses fastaRegexFinder to find the motifs in the genome, developped by https://github.com/dariober/bioinformatics-cafe 

## Repository content
- DCM_motifs_in_Genome/ directory contains :
```bash
├── DCM_motifs_in_Genome
│   ├── Danio_rerio
│   │   ├── Ensembl
│   │   │   ├── dcm_motifs_1_based.bed
│   │   │   ├── dcm_motifs_zero_based.bed
│   │   │   └── job.sh
│   │   └── Lawson
│   │       ├── dcm_motifs_one_based.bed
│   │       ├── dcm_motifs_zero_based.bed
│   │       └── job.sh
│   ├── fastaRegexFinder.py
│   └── Mus_Musculus
│       └── Ensembl
│           ├── dcm_motifs_one_based.bed
│           ├── dcm_motifs_zero_based.bed
│           └── job.sh
```
Each subdirectory named by the specie contains two bed files containing the positions of DCM binding motifs in the corresponding specie using the corresponding genome assembly. Those were generated with job.sh and are based on fastaRegexFinder.py (https://github.com/dariober/bioinformatics-cafe).

```bash
└── Downstream_Analysis
    ├── Inside_vs_Outside_Ensembl.ipynb #Complete pipeline to analyse DCM motifs in Ensembl annotation.
    ├── Inside_vs_Outside_Lawson.ipynb #Complete pipeline to analyse DCM motifs in Lawson annotation.
    ├── complementary_genes_overlap.ipynb #Assess the proportion of the genome corresponding to an overlap between two genes encoded on complementary strands.
    ├── count_DCM_motifs.jl #Print number of DCM motifs in a sequence (Fasta file).
    ├── DCM_in_enhancers.ipynb #Look for DCM motifs in enhancers.
    ├── DCM_in_genes_of_interest.ipynb #Look for DCM motifs in genes of interest.
    ├── Enhancers_inside_genes.ipynb #Study the proportion of enhancers falling inside genes.
    ├── GC_content.ipynb 
    └── gene_length_dcm_counts.ipynb #Correlation between gene length and its number of DCM motifs.
```

Inside_vs_Outside_Ensembl.ipynb and Inside_vs_Outside_Lawson.ipynb notebooks are the most important as they contain the complete genome analysis pipeline. Adapt the paths under section "Ensembl File Loading" and "Lawson File Loading" respectively.
The other codes are additional analysis on the side. 

## Genomes Versions
- Danio rerio by Ensembl: Danio_rerio.GRCz11.dna.primary_assembly.fa
- Danio rerio by Lawson lab (https://www.umassmed.edu/lawson-lab/reagents/zebrafish-transcriptome/) : version V4.3.2
- Mus Musculus by Ensembl: Mus_musculus.GRCm39.dna.primary_assembly.fa
- Annotations provided by DANIO-CODE (longPec_PADREs.bed)
