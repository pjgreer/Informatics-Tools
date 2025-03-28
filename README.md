# Informatics-Tools
Place to store tools and scripts that make my work life easier

hla_vcf_liftover_merge.sh is a bash script to take the vcf files produced by SpecHLA (https://github.com/deepomicslab/SpecHLA) and converth then over to grch38 positions. It 
used the files located in the HLA_liftover_refs folder, namely the chromosome 6 Human reference geneome fasta + dictionary files and the liftover.chn file produced using flo 
(https://github.com/wurmlab/flo) a very fast ruby implementation of the UCSC liftover scripts. SpecHLA outputs a folder for each subject in the outputdir. By listing all the
subject directory names into a file `sample_name.txt` you can loop over every sample in your outdirectory. each gene vcf file is liftedover to grch38 and then combined and 
sorted using bcftools. Thsi final vcf file is then ready to be merged back into you main vcf file.

