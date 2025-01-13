process quast_sr_prepolish{

    container = 'assembly_sr:latest'

    tag "Quast_sr_prepolish"

    publishDir = [
            path: './results/quast_sr_prepolish',
            mode: 'copy'
        ]

 input:
path (consensus)

 output:
path "${read}_quast", emit: quast_out

 script:
   """
   quast.py -o ${read}_quast $consensus

   """
}

process quast_sr_postpolish{

    container = 'assembly_sr:latest'

    tag "Quast_sr_postpolish"

    publishDir = [
            path: './results/quast_sr_postpolish',
            mode: 'copy'
        ]

 input:
path (consensus)

 output:
path "${read}_quast", emit: quast_out

 script:
   """
   quast.py -o ${read}_quast $consensus

   """
}