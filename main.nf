#!/usr/bin/env nextflow

nextflow.enable.dsl=2

//Quality control
include {nanoq} from "./modules/qc_modules/nanoq.nf"
include {falco_pre} from "./modules/qc_modules/falco.nf"
include {porechop} from "./modules/qc_modules/porechop.nf"
include {fastqc} from "./modules/qc_modules/fastqc.nf"

//Taxonomy
include{kraken2} from "./modules/tax_modules/kraken2.nf" 
include{kaiju} from "./modules/tax_modules/kaiju.nf"

//Long reads 
include {flye} from "./modules/lr_modules/flye.nf"
include {quast_lr_prepolish} from "./modules/lr_modules/quast_lr.nf"
include{medaka} from "./modules/lr_modules/medaka.nf" //You can run on GPUs or with Google Colab
include {quast_lr_postpolish} from "./modules/lr_modules/quast_lr.nf"
include {busco_lr} from "./modules/lr_modules/busco_lr.nf"

//Short reads 
include {unicycler} from "./modules/sr_modules/unicycler.nf"
include {quast_sr_prepolish} from "./modules/sr_modules/quast_sr.nf"
include{pilon} from "./modules/sr_modules/pilon.nf" 
include {quast_sr_postpolish} from "./modules/sr_modules/quast_sr.nf"
include {busco_sr} from "./modules/sr_modules/busco_sr.nf"

//Annotation
include{pgap} from "./modules/annotation_modules/pgap.nf"
include{mob_racon} from "./modules/annotation_modules/mob_recon.nf"
include{trnascan} from "./modules/annotation_modules/trnascan.nf"
include{prokka} from "./modules/annotation_modules/prokka.nf"
include{antismash} from "./modules/annotation_modules/antismash.nf"
include{barrnap} from "./modules/annotation_modules/barrnap.nf"

 
files = Channel.fromPath( './data/*.fastq*')


workflow {

//Quality control

//falco_pre(files)
//nanoq(files)
porechop(files)
//fastqc(porechop.out.porechop_out)

//Taxonomy

//kaiju(files)
//kraken2(files)

//Long read

flye(porechop.out.porechop_out)
//quast_lr_prepolish(flye.out.flye_out)
medaka(files, flye.out.flye_out)
//quast_lr_postpolish(medaka.out.medaka_out)
//busco_lr(medaka.out.medaka_out)

//Short read

//unicycler(porechop.out.porechop_out)
//quast_sr_prepolish(unicycler.out.unicycler_out)
//pilon(files, unicycler.out.unicycler_out)
//quast_sr_postpolish(pilon.out.pilon_out)
//busco_sr(pilon.out.pilon_out)

//Annotation

//pgap(medaka.out.medaka_out)
//prokka(medaka.out.medaka_out)
//antismash(medaka.out.medaka_out)
//barrnap(medaka.out.medaka_out)
//mob_recon(medaka.out.medaka_out)
//trnascan(medaka.out.medaka_out)

}

THREADS      = params.THREADS
BARCODE_THRESHOLD  = params.BARCODE_THRESHOLD
LINEAGE    = params.LINEAGE
KINGDOM    = params.KINGDOM 
MODEL      = params.MODEL


println """\

GENOMICS = +
===================================
System parameters:
- THREADS               : ${params.THREADS}

Trimming and Adapter Removal parameters:
-BARCODE_THRESHOLD      : ${params.BARCODE_THRESHOLD} 

Long Reads
-LINEAGE                : ${params.LINEAGE}
-MODEL                  : ${params.MODEL}

Annotation parameters:
-KINGDOM                : ${params.KINGDOM}
  
         """
         .stripIndent()
