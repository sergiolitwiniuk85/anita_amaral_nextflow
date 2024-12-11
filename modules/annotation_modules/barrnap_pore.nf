process barrnap_pore{ 

    tag "Barrnap_pore"
publishDir ("outdir_barrnap_pore/${name}_barrnap", mode: 'copy')

    input:
 val(name)
 path (assembly) 

    output:
path "${name}_barrnap"

    script:
    """
   barrnap --kingdom ${params.KINGDOM} --threads ${params.THREADS} --outseq ${name}_barrnap ${assembly} 

    """
    }
