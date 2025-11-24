#!/bin/sh

#SBATCH -J fastaregexfinder
#SBATCH --mem=5000
#SBATCH -t 2:00:00
#SBATCH --mail-type=BEGIN,END
#SBATCH -o output_fastaregexfinder
#SBATCH -e error_fastaregexfinder

genome='/path_to_Reference/Mouse/Mus_musculus.GRCm39.dna.primary_assembly.fa'

python3 ../../fastaRegexFinder.py -f $genome -r 'CCAGG' > CCAGG_motifs.bed

python3 ../../fastaRegexFinder.py -f $genome -r 'CCTGG' > CCTGG_motifs.bed

cat CCAGG_motifs.bed CCTGG_motifs.bed > tmp.bed

awk 'BEGIN{OFS="\t"} {print $1, $2, $3, $4, $6, $7}' tmp.bed > tmp_.bed

bedtools sort -i tmp_.bed > dcm_motifs_zero_based.bed

awk 'BEGIN{OFS="\t"} {$2=$2+1; print}'  dcm_motifs_zero_based.bed >  dcm_motifs_one_based.bed

rm tmp.bed tmp_.bed
