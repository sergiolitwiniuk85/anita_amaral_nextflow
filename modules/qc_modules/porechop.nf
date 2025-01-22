process porechop{

    tag "Porechop"

    input:
path (reads)

    output:
path "*porechop.fastq", emit: porechop_out

    script:
    """
    porechop -i ${reads} -o ${reads}_porechop.fastq --barcode_threshold ${params.BARCODE_THRESHOLD}  --require_two_barcodes
    
    """
}