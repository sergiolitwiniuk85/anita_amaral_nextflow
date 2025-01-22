process busco_sr{
    
    tag "Busco_sr"

    input:
path (consensus) 

    output:
path "${reads}_busco", emit: busco_out


    script:
    """
    busco -i $consensus -o ${reads}_busco -l ${params.LINEAGE} -m genome --${params.THREADS}
 
    """
}