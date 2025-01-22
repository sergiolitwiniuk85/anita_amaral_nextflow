process prokka{ 

    tag "Prokka"

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
    prokka --kingdom ${params.KINGDOM}  --cpus ${params.THREADS} --outdir ${consensus}_prokka  $consensus
    """
    }