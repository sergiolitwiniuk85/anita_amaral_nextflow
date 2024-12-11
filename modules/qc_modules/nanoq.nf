process nanoq{

    tag "Nanoq"
publishDir("outdir_nanoq/${name}_nanoq.txt", mode:'copy')

    input:
val(name)
path (reads)

    output:
path "*nano.txt"

    script:
    """
    nanoq -j -s -i ${reads}> ${name}_nano.txt
    
    """
}