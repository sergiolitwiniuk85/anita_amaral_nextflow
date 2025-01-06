process falco{

   container = 'container_qc:latest'
   
   tag "Falco"
   
   publishDir = [
            path: './results/falco',
            mode: 'copy'
        ]

    input:
   path (reads)

    output:
    path "*"

    script:
    """
    falco -a -R ${reads} 
    """
}
