process pilon{

    container = 'assembly_sr:latest'

    tag "Pilon"

    publishDir = [
            path: './results/pilon',
            mode: 'copy'
        ]
        
 input:
path (reads)
path (assembly)

    output:
path "${reads}_pilon/consensus.fasta", emit: pilon_out

    script:
    """
pilon --genome $assembly --frags $read_bam --jumps $read_bam --unpaired $read_unpaired_bam  --outdir ${reads}_pilon

    """
}