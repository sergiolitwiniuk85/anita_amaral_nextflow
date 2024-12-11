process kraken2{

    tag "Kraken2"
publishDir("outdir_kraken2/${name}.report", mode:'copy')

    input:
val(name)
path (reads)

    output:
path "${name}.report"

    script:
    """
    kraken2 --db /media/administrador/Data/becarios_Julian/Ana_Amaral/nt_Database_sm/ --threads 24 ${reads} --report ${name}.report
    
    
    """
}
