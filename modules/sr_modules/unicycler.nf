process unicycler{
 
   container = 'assembly_sr:latest'
    
    tag "Unicycler"

publishDir = [
            path: './results/unicycler',
            mode: 'copy'
        ]

    input:
path (reads) 

    output:
path "${reads}_unicycler/assembly.fasta", emit: unicycler_out
path "${reads}_unicycler/assembly.gfa", emit: gfa_out
path "${reads}_unicycler/unicycler.log", emit: log_out

    script:
    """
    unicycler -1 $short_reads -2 $short_reads -l $long_reads -o ${reads}_unicycler
    """
}