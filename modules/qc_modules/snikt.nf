process snikt{

container = 'busco:latest'

tag "Snikt.R"

 publishDir = [
            path: './results/snikt.R',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "*snikt.fastq", emit: snikt_out
path "*snikt.html"

    script:
    """
    snikt.R --filter=${params.FILTER} --trim5=${params.TRIM5} --trim3=${params.TRIM3}  -o ${reads}_snikt  ${reads}
    
    """
}