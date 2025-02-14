process medaka{

    tag "Medaka"

  publishDir = [
            path: './results/medaka',
            mode: 'copy'
        ]
  
 input:
path (reads)
path (assembly)

    output:
path "medaka_output/consensus.fasta", emit: medaka_out

    script:
    """
medaka_consensus -i $reads -d $assembly  \ -o medaka_output -t ${params.THREADS} -m ${params.MODEL}

    """
}