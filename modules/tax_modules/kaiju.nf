process kaiju{

    container = '__'

    tag "Kaiju"

    publishDir = [
            path: './results/kaiju',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "${reads}.report"

    script:
    """
    kaiju -t nodes.dmp -f kaiju_db_nr.fmi -i $reads
    
    """
}