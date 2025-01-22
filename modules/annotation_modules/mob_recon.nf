process mob_racon{ 

    container = 'annotation:latest'
    
    tag "Mob_racon"

publishDir = [
            path: './results/mob_racon',
            mode: 'copy'
        ]

    input:
 path (consensus) 

    output:
path "${consensus}_mob"

    script:
    """
   mob_recon --infile $consensus --outdir ${consensus}_mob

    """
    }