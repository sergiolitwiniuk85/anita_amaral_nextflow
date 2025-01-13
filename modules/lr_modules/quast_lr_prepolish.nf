process quast_lr_prepolish{

    container = 'assembly_lr:latest'

    tag "Quast_lr_prepolish"

    publishDir = [
            path: './results/quast_lr_prepolish',
            mode: 'copy'
        ]

 input:
path (assembly)

 output:
path "${read}_quast", emit: quast_out

 script:
   """
   quast.py -o ${read}_quast $assembly

   """
}