process porechop{

    tag "Porechop"
publishDir("outdir_porechop/${name}_porechop.fastq", mode:'copy')

    input:
val(name)
path (reads)

    output:
path "*porechop.fastq", emit: porechop_out

    script:
    """
    porechop -i ${reads} -o ${name}_porechop.fastq --barcode_threshold ${params.BARCODE_THRESHOLD} --require_two_barcodes
    
    """
}