process medaka_pore{

    tag "Medaka_pore"
publishDir("outdir_medaka_pore/${name}_medaka.fasta", mode:'copy')

 input:
val(name)
path (reads)
path (assembly)

    output:
path "${name}_medaka_output/consensus.fasta", emit: medakasnikt_out

    script:
    """
medaka_consensus -d $assembly -i $reads \ -o ${name}_medaka_output -t 2 -m ${params.MODEL}

    """
}