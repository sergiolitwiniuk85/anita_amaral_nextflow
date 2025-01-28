process barrnap{ 

    tag "Barrnap"

    input:
 path (consensus) 

    output:
path "${consensus}_barrnap"

    script:
    """
   barrnap --kingdom ${params.KINGDOM} --threads ${params.THREADS} --outseq ${consensus}_barrnap $consensus 

    """
    }
