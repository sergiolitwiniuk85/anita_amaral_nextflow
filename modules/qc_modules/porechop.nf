process porechop{

   container = 'assembly_qc:latest'

    tag "Porechop"

    publishDir = [
            path: './results/porechop',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "*porechop.fastq", emit: porechop_out

    script:
    """
    porechop -i ${reads} -o ${reads}_porechop.fastq --barcode_threshold 85 --require_two_barcodes
    
    """
}