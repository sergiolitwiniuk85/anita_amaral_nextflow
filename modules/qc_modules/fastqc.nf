process fastqc{

   tag "Fastqc"
publishDir("outdir_fastq/fastqc_${name}_logs", mode:'copy')

   input:
val(name)
path (reads)

   output:
path "fastqc_${name}_logs"

   script:

   """
   mkdir fastqc_${name}_logs
   fastqc -o fastqc_${name}_logs -t ${params.THREADS} ${reads}
   """
}


