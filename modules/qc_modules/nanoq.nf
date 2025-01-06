process nanoq{

    container = 'assembly_qc:latest'

    tag "Nanoq"

publishDir = [
            path: './results/nanoq',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "*nano.txt"

    script:
    """
    nanoq -j -s -i ${reads}> ${reads}_nano.txt
    
    """
}