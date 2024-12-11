process antismash_pore{ 

    tag "Antismash"
publishDir ("outdir_antismash_pore/${name}_antismash", mode: 'copy')

   input:
 val(name)
 path (assembly) 

    output:
path "${name}_antismashsnikt"

    script:
    """
       antismash -c 32 --genefinding-tool prodigal --output-dir ${name}_antismash $assembly   
    """
    }
