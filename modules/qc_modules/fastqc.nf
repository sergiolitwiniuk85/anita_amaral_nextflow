process fastqc{

   container = 'container_qc:latest'
   
   tag "FastQC"
   
   publishDir = [
            path: './results/fastqc',
            mode: 'copy'
        ]

    input:
   path (reads)

    output:
    path "fastqc_${reads}_logs"

    script:
    """
   mkdir -p fastqc_${reads}_logs
   xvfb-run fastqc -o fastqc_${reads}_logs -t ${params.THREADS} $reads 

    """
}