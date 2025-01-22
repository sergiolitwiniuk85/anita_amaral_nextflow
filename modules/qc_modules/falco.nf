process falco_pre{

   container = 'container_qc:latest'
   
   tag "Falco_pre"
   
   publishDir = [
            path: './results/falco_pre',
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

process falco_post{

   container = 'container_qc:latest'
   
   tag "Falco_post"
   
   publishDir = [
            path: './results/falco_post',
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