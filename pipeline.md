```mermaid

flowchart TD


    Start([Start]) --- A([Falco: Pre-QC
    ])
    A --- C([Snikt: Trimming])
    A --- D0([Porechop: Trimming])
    D0 --- D1([Falco: Pöst-QC])
    D1 --- D([nanoq: Stats & trimming])

    D --- E(Taxonomic Classification:<br/> Kraken2 <br/> Centrifuge <br/> Wink <br/> Metamaps <br/> Megan-LR <br/> Malt <br/> Ganon <br/> Kaiju <br/> DIAMOND  )


    D --- G([Flye: Assembly])
    D --- GS([Unicylcer: Assembly])


subgraph Assembly-LR
    G --- J([Quast: Assembly QC])

    G --- M([Medaka: Polishing_Colab])
    M --- QL1([Quast: Post-QC])
    M --- QL2([Busco: Completeness])

end


subgraph Annotation
    M --- P([Prokka: Annotation])
    P --- S0([CDS, rRNA, tRNA, tmRNA, 16s, misc_RNA]) 

    P --- S
    M --- S([AntiSMASH: Secondary Metabolite Prediction])


    M --- P1([Mob-recon: Plasmids])


    M --- RL1([Barrnap:<br/> Ribosomal RNA Predictor])
    M --- RL2([tRNAscan-SE:<br/> transfer RNA detection])

    S0 --- End
    S --- End
    P1 --- End
end


subgraph Assembly-SR

    GS --- JS0([Quast: Assembly QC])    
    GS --- PS([Pilon: ])

    PS --- QS1([Quast: Post-QC])
    PS --- QS2([Busco: Completeness])

    PS ----- RL1([Barrnap:<br/> Ribosomal RNA Predictor])
    PS ----- RL2([tRNAscan-SE:<br/> transfer RNA detection])
    PS ----- P([Prokka: Annotation])
    PS ----- S([AntiSMASH: Secondary Metabolite Prediction])

    QS1 --- e0([End])
    QS2 --- e0([End])

end
    QL1 --- V([Shinny:<br/> Visualization])
    QL2 --- V([Shinny:<br/> Visualization])


    e0 --- V([Shinny:<br/> Visualization])
    End --- V([Shinny:<br/> Visualization])
