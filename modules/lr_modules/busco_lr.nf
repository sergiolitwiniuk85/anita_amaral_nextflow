process busco_lr{
   
    tag "Busco_lr"

    input:
path (consensus) 

    output:
path "${reads}_busco", emit: busco_out


    script:
    """
    busco -i $consensus -o ${reads}_busco -l ${params.LINEAGE} -m genome --cpu ${params.THREADS}
 
    """
}