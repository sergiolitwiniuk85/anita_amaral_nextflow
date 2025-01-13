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
//path "$sorted_reads.bam"
//path "$sorted_index_reads.bam"
path "${reads}_pilon/consensus.fasta", emit: pilon_out

    script:
    """
bwa index $assembly &&
bwa sw $assembly $read1.fq $read2.fq > $alignment.sam && 
santools sort -0 $sorted_reads.bam $aligment.sam &&
samtools index $sorted_index_reads.bam &&
pilon --genome $assembly --bam $sorted_reads.bam  --outdir ${reads}_pilon

    """
}