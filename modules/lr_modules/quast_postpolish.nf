process quast_postpolish{

    container = 'assembly_lr:latest'

    tag "Quast_postpolish"

    publishDir = [
            path: './results/quast_postpolish',
            mode: 'copy'
        ]

 input:
path (consensus)

 output:
path "${read}_quast", emit: quast_out

 script:
   """
   quast.py -o ${read}_quast $assembly

   """
}