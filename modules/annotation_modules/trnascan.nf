process trnascan{ 

    container = '__'
    
    tag "tRNAscan"

publishDir = [
            path: './results/tRNAscan',
            mode: 'copy'
        ]

    input:
 path (consensus) 

    output:
path "*.txt"

    script:
    """
   tRNAscan-SE -o ${consensus}_tRNAscan_results.txt $consensus
    """
    }