process flye{
 
   container = 'assembly_lr:latest'
    
    tag "Flye"

publishDir = [
            path: './results/flye',
            mode: 'copy'
        ]

    input:
path (reads) 

    output:
path "${reads}_flye/assembly.fasta", emit: flye_out
path "${reads}_flye/assembly_graph.*", emit: graph_out
path "${reads}_flye/assembly_info.txt", emit: info_out

    script:
    """
    flye --nano-hq $reads -o ${reads}_flye  -t 32 --meta 
    """
}