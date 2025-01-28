process busco_lr{
   
    tag "Busco_lr"

    input:
path (consensus) 

    output:
path "${consensus}_busco", emit: busco_out


    script:
    """
    busco -i $consensus -o ${consensus}_busco -l ${params.LINEAGE} -m genome --cpu ${params.THREADS}
 
    """
}