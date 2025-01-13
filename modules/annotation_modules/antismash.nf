process antismash{ 

    container = '__'
    
    tag "Antismash"

publishDir = [
            path: './results/antismash',
            mode: 'copy'
        ]

   input:
 path (consensus) 

    output:
path "${name}_antismash"

    script:
    """
       antismash -c 32 --genefinding-tool prodigal --output-dir ${consensus}_antismash $consensus  
    """
    }
