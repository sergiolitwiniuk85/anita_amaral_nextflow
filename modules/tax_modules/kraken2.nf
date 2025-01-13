process kraken2{

    container = '__'

    tag "Kraken2"

    publishDir = [
            path: './results/kraken2',
            mode: 'copy'
        ]

    input:
path (reads)

    output:
path "${reads}.report"

    script:
    """
    kraken2 --db /media/administrador/Data/becarios_Julian/Ana_Amaral/nt_Database_sm/ --threads 24 ${reads} --report ${reads}.report
    
    """
}
