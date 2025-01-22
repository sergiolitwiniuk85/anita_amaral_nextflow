process medaka{

    tag "Medaka"
        
 input:
path (reads)
path (assembly)

    output:
path "${reads}_medaka_output/consensus.fasta", emit: medaka_out

    script:
    """
medaka_consensus -d $assembly -i $reads \ -o ${reads}_medaka_output -t ${params.THREADS} -m ${params.MODEL}

    """
}