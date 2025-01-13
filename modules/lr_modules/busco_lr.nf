process busco_lr{
 
   container = 'busco:latest'
    
    tag "Busco_lr"

publishDir = [
            path: './results/busco_lr',
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