process prokka{ 

       container = '__'
    
    tag "Prokka"

publishDir = [
            path: './results/prokka',
            mode: 'copy'
        ]

input:
path (consensus)

    output:
path "${consensus}_prokka/${consensus}.faa"
path "${consensus}_prokka/${consensus}.err"
path "${consensus}_prokka/${consensus}.ffn"
path "${consensus}_prokka/${consensus}.gff", emit: prokka_out
path "${consensus}_prokka/${consensus}.txt"
path("${consensus}_prokka/*")

    script:
    """
    prokka --kingdom Bacteria  --cpus 4 --outdir ${consensus}_prokka  $consensus
    """
    }