process barrnap{ 

    container = '__'
    
    tag "Barrnap"

publishDir = [
            path: './results/barrnap',
            mode: 'copy'
        ]

    input:
 path (consensus) 

    output:
path "${consensus}_barrnap"

    script:
    """
   barrnap --kingdom Bacteria --threads 4 --outseq ${consensus}_barrnap ${consensus} 

    """
    }
