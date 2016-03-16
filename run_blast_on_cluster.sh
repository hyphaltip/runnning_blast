#PBS -l nodes=1:ppn=4,walltime=1:00:00 -j oe

cd $PBS_O_WORKDIR
# this got run once before we started
# makeblastdb -in uniprot_sprot.fasta -title "SwissProtDB" -dbtype prot -parse_seqids
# comments here
# load the module so you have BLAST tools in your path
module load ncbi-blast
DB=/bigdata/stajichlab/shared/db/uniprot_sprot.fasta
blastp -query bacillus_hit.fa -db $DB -evalue 1e-50 -out bacillus_sprot.BLASTP.tab -outfmt 7 -num_threads 4
