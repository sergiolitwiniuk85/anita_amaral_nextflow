process busco_sr{
 
   container = 'busco:latest'
    
    tag "Busco_sr"

publishDir = [
            path: './results/busco_sr',
            mode: 'copy'
        ]

    input:
path (consensus) 

    output:
path "${reads}_busco", emit: busco_out


    script:
    """
    busco -i $consensus -o ${reads}_busco -l <lineage> -m genome --cpu 4
 
    """
}