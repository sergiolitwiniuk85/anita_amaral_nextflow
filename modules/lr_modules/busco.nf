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
path "${reads}_flye/assembly.fasta", emit: flye_out


    script:
    """
    flye --nano-hq $reads -o ${reads}_flye  -t 32 --meta 
    """
}