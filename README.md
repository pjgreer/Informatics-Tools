# Informatics-Tools
Place to store tools and scripts that make my work life easier

# hla_vcf_liftover_merge.sh 
`hla_vcf_liftover_merge.sh` is a bash script to take the vcf files produced by SpecHLA (https://github.com/deepomicslab/SpecHLA) and converts them over to grch38 positions. It 
used the files located in the HLA_liftover_refs folder, namely the chromosome 6 Human reference geneome fasta + dictionary files (bundles together as a tar.gz file) and the 
liftover.chn file produced using flo (https://github.com/wurmlab/flo) a very fast ruby implementation of the UCSC liftover scripts. SpecHLA outputs a folder for each subject  
in the out-directory. By listing all the subject directory names into a file `sample_name.txt` you can loop over every sample in your out-directory. Each gene vcf file is 
lifted over to grch38 and then combined and sorted using bcftools. This final vcf file is then ready to be merged back into you main vcf file.

