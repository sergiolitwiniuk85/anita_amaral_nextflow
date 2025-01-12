process busco{
 
   container = 'busco:latest'
    
    tag "Busco"

publishDir = [
            path: './results/busco',
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