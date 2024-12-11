process prokka_pore{ 

        tag "Prokka"
publishDir ("outdir_prokka_pore/${name}_prokka", mode: 'copy')

input:
 val(name)
path (assembly)

    output:
path "${name}_prokka/${name}.faa"
 path "${name}_prokka/${name}.err"
path "${name}_prokka/${name}.ffn"
path "${name}_prokka/${name}.gff"
path "${name}_prokka/${name}.txt"
path("${name}_prokka/*")

    script:
    """
    prokka --kingdom ${params.KINGDOM}  --cpus ${params.THREADS} --outdir ${name}_prokka --prefix ${name} ${assembly}
    """
    }