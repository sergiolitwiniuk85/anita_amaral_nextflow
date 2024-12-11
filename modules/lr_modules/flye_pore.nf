process flye_pore{

    tag "Flye_pore"
publishDir("outdir_flye_pore/${name}_flye", mode:'copy')

    input:
 val(name)
path (reads) 

    output:
path "${name}_flye/assembly.fasta", emit: flyepore_out
path "${name}_flye/assembly_graph.*", emit: graphpore_out
path "${name}_flye/assembly_info.txt", emit: infopore_out

    script:
    """
    flye --nano-hq $reads -o ${name}_flye  -t 32 --meta 
    """
}