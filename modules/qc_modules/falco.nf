process falco{

   container = 'assembly_qc:latest'
   
    input:
   path (reads)

    output:
    path "*"

    script:
    """
    falco -a -R ${reads} 
    """
}
