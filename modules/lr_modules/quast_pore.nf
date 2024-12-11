process quast_pore{

    tag "Quast_pore"
    publishDir("outdir_quast_pore/${name}_quast", mode:'copy')

 input:
 val(name)
path (assembly)

 output:
path "${name}_quast", emit: quastpore_out

 script:
   """
   quast.py -o ${name}_quast $assembly

   """
}