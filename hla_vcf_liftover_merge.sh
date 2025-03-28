#!/bin/bash

while IFS="" read -r LINE || [ -n "$LINE" ];

do
    declare -a arr=("HLA_A" "HLA_B" "HLA_C" "HLA_DPA1" "HLA_DPB1" "HLA_DQA1" "HLA_DQB1" "HLA_DRB1")
    for HLA in "${arr[@]}"
    do
      java -jar ~/bin/picard.jar LiftoverVcf \
          -I ${LINE}/${HLA}.rephase.vcf.gz \
          -O ${LINE}/${LINE}-${HLA}.rephase.hg38.vcf \
          -CHAIN ~/HLA_liftover_refs/liftover.chn \
          -REJECT ${LINE}/${LINE}-${HLA}-rejected_variants.vcf \
          -R ~/HLA_liftover_refs/Homo_sapiens_assembly38_chr6.fa
    done

ls ${LINE}/${LINE}*hg38.vcf > ${LINE}-mergelist.txt
bcftools concat -f ${LINE}-mergelist.txt | bcftools sort -Oz  > ${LINE}-HLA.all.vcf.gz
bcftools index -t ${LINE}-HLA.all.vcf.gz

done < sample_names.txt
