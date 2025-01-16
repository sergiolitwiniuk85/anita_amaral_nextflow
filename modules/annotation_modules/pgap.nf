process pgap{ 

    container = '__'
    
    tag "Pgap"

publishDir = [
            path: './results/pgap',
            mode: 'copy'
        ]

    input:
 path (consensus) 

    output:
path "${consensus}_pgap_results"

    script:
    """
   pgap.py -genome $consensus -cpus 4 -outdir ${consensus}_pgap_results

    """
    }