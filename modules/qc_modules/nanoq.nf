process nanoq{

    container = 'container_qc:latest'

    tag "Nanoq"

publishDir = [
            path: './results/nanoq',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "${reads}_nanoQC"

    script:
    """
    nanoQC -o ${reads}_nanoQC ${reads}
    
    """
}