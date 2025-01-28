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
path "${assembly}_quast", emit: quast_out

 script:
   """
   quast.py -o ${assembly}_quast $assembly

   """
}

process quast_lr_postpolish{

    container = 'assembly_lr:latest'

    tag "Quast_lr_postpolish"

    publishDir = [
            path: './results/quast_lr_postpolish',
            mode: 'copy'
        ]

 input:
path (consensus)

 output:
path "${consensus}_quast", emit: quast_out

 script:
   """
   quast.py -o ${consensus}_quast $consensus

   """
}