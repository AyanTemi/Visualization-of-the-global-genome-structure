#!usr/bin/env bash

mkdir HackBio_Project && cd HackBio_Project

#Downloading the dataset

#Chromosome 1 data
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz


#Panel file
wget http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20130502.ALL.panel


#Sample list
wget https://github.com/AyanTemi/Visualization-of-the-global-genome-structure/blob/main/complete_1000_genomes_sample_list_.tsv.txt 

#Converting the variant call format (vcf) files to pedigree (ped) files.
#Downloading the vcf_to_ped_convert.pl script
wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/browser/vcf_to_ped_converter/version_1.1/vcf_to_ped_convert.pl

#Change file permission
chmod 755 vcf_to_ped_convert.pl

#Index the vcf files with tabix
tabix -p ALL.chr1.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz

#run the perl script using the four required parameters
perl vcf_to_ped_convert.pl -vcf  ALL.chr1.phase3_shapeit2_mvncall_integrated_v5b.20130502.genotypes.vcf.gz -sample_panel_file integrated_call_samples_v3.20130502.ALL.panel -region 1:1-150000 -population GBR -population FIN -population CHS -population KHV -population BEB -population PUR -population ACB -population ASW -population YRI -population GWD -population JPT -population MSL -population CEU -population ESN -population CHB -population CLM -population CDX -population PEL -population PJL -population IBS -population TSI -population MXL -population LWK -population GIH -population STU -population ITU  -base_format letter

#Convert the info file to map
#Download the info_to_map script
wget https://raw.githubusercontent.com/AyanTemi/Visualization-of-the-global-genome-structure/main/info_to_map.pl.txt

#Run the script
perl info_to_map.pl 1_1-150000.info > 1_1-150000.map

#Generate the binary versions of ped and map files. 
#Create directory plink_install and Download and install plink 
mkdir plink_install && cd plink_install
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20220402.zip

#Unzip the zipped file
sudo unzip plink_linux_x86_64_20220402.zip -d plink_install

#Make PLINK accessible from the command line
sudo cp plink /usr/local/bin
sudo chmod 755 /usr/local/bin/plink

#Add plink to path
sudo nano ~/.bashrc

#add the following to the end of the line in the opened nano editor
export PATH=/usr/local/bin:$PATH

#Test the installation
plink

#Chang directory back to the project directory
cd ..

#Generate the binary file with plink
plink --file 1_1-150000 --make-bed --out 1_1-150000

#Performing principal component analysis
plink --bfile 1_1-150000 --pca 

#The plot can then be generated in R Studio
#Check the R_Script in this repository

