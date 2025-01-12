process medaka{

    container = 'assembly_lr:latest'

    tag "Medaka"

    publishDir = [
            path: './results/medaka',
            mode: 'copy'
        ]
        
 input:
path (reads)
path (assembly)

    output:
path "${reads}_medaka_output/consensus.fasta", emit: medaka_out

    script:
    """
medaka_consensus -d $assembly -i $reads \ -o ${reads}_medaka_output -t 2 -m r941_min_fast_g507

    """
}