#!/usr/bin/env nextflow

nextflow.enable.dsl=2

//Quality control
//include {nanoq} from "./modules/qc_modules/nanoq.nf"
include { falco } from "./modules/qc_modules/falco.nf"
//include {porechop} from "./modules/qc_modules/porechop.nf"

//Taxonomy
//include{kraken2} from "./modules/tax_modules/kraken2.nf" 
//include{kaiju} from "./modules/tax_modules/kaiju.nf"

//Long reads 
//include {flye} from "./modules/lr_modules/flye.nf"
//include {quast} from "./modules/lr_modules/quast.nf"
//include{medaka} from "./modules/lr_modules/medaka.nf" //You can run on GPUs or with Google Colab
//include {busco} from "./modules/lr_modules/busco.nf"

//Short reads 
//include {unicylcer} from "./modules/sr_modules/unicycler.nf"
//include {quast} from "./modules/sr_modules/quast.nf"
//include{pilon} from "./modules/sr_modules/pilon.nf" //You can run on GPUs or with Google Colab
//include {busco} from "./modules/sr_modules/busco.nf"

//Annotation
//include{pgap} from "./modules/annotation_modules/pgap.nf"
//include{mob_recon} from "./modules/annotation_modules/mo_recon.nf"
//include{trnascan} from "./modules/annotation_modules/trnascan.nf"
//include{prokka} from "./modules/annotation_modules/prokka.nf"
//include{antismash} from "./modules/annotation_modules/antismash.nf"
//include{barrnap} from "./modules/annotation_modules/barrnap.nf"



/*println """\

GENOMICS = +
===================================
System parameters:

- PROJECTDIR            : projectDir
- WORKFLOW              : WORKFLOW
- CACHEDIR              : CACHEDIR

Trimming and Adapter Removal parameters:
-FILTER                 : {params.FILTER}
-TRIM5                  : {params.TRIM5}
-TRIM3                  : {params.TRIM3} 
-LENGTH                 : {params.LENGTH} 
-HEADCROP               : {params.HEADCROP}
-BARCODE_THRESHOLD      : {params.BARCODE_THRESHOLD} 
Polishing:
-MODEL                  : {params.MODEL}

Annotation parameters:
-KINGDOM                : {params.KINGDOM}
  
         """
         .stripIndent()


*/
 
files = Channel.fromPath( './data/*.fastq*')



workflow {

falco(files)
//nanoq(files)
//fastqc(files)
//kraken2(files)
//porechop(files)
//fastqc_snikt(snikt.out.snikt_out)
//flye_pore(porechop.out.porechop_out)
//medaka_pore(files, flye_pore.out.flyepore_out)
//quast_pore( flye_pore.out.flyepore_out)
//prokka_pore( flye_pore.out.flyepore_out)prokka_snikt(ch_name, flye_snikt.out.flyesnikt_out) 
//antismash_nano(ch_name, flye_nano.out.flyenano_out)
//antismash_pore(ch_name, flye_pore.out.flyepore_out)
//antismash_snikt(ch_name, flye_snikt.out.flyesnikt_out)


}
