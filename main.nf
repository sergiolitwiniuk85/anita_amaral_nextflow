#!/usr/bin/env nextflow

THREADS      = params.THREADS
WORKFLOW     = workflow.workDir
CACHEDIR     = params.CACHEDIR

FILTER      = params.FILTER
TRIM5      = params.TRIM5
TRIM3      = params.TRIM3
LENGTH     = params.LENGTH
HEADCROP    = params.HEADCROP
BARCODE_THRESHOLD  = params.BARCODE_THRESHOLD
KINGDOM    = params.KINGDOM 
MODEL      = params.MODEL


println """\

GENOMICS = +
===================================
System parameters:
- THREADS               : ${params.THREADS}
- PROJECTDIR            : $projectDir
- WORKFLOW              : $WORKFLOW
- CACHEDIR              : $CACHEDIR

Trimming and Adapter Removal parameters:
-FILTER                 : ${params.FILTER}
-TRIM5                  : ${params.TRIM5}
-TRIM3                  : ${params.TRIM3} 
-LENGTH                 : ${params.LENGTH} 
-HEADCROP               : ${params.HEADCROP}
-BARCODE_THRESHOLD      : ${params.BARCODE_THRESHOLD} 

Polishing:
-MODEL                  : ${params.MODEL}

Annotation parameters:
-KINGDOM                : ${params.KINGDOM}
  
         """
         .stripIndent()


include {nanoq} from "./modules/nanoq.nf"
include {fastqc} from "./modules/fastqc.nf"
include{kraken2} from "./modules/kraken2.nf" 
include {nanofilt} from "./modules/nanofilt.nf"
include {porechop} from "./modules/porechop.nf"
include {snikt} from "./modules/snikt.nf"
include {fastqc_snikt} from "./modules/fastqc_snikt.nf"
include {flye_nano} from "./modules/flye_nano.nf"
include {flye_pore} from "./modules/flye_pore.nf"
include {flye_snikt} from "./modules/flye_snikt.nf"
include {quast_nano} from "./modules/quast_nano.nf"
include {quast_pore} from "./modules/quast_pore.nf"
include {quast_snikt} from "./modules/quast_snikt.nf"
include{medaka_nano} from "./modules/medaka_nano.nf" //You can run on GPUs or with Google Colab
include{medaka_pore} from "./modules/medaka_pore.nf" //You can run on GPUs or with Google Colab
include{medaka_snikt} from "./modules/medaka_snikt.nf" //You can run on GPUs or with Google Colab
include{prokka_nano} from "./modules/prokka_nano.nf"
include{prokka_pore} from "./modules/prokka_pore.nf"
include{prokka_snikt} from "./modules/prokka_snikt.nf"
include{antismash_nano} from "./modules/antismash_nano.nf"
include{antismash_pore} from "./modules/antismash_pore.nf"
include{antismash_snikt} from "./modules/antismash_snikt.nf" 
 
files = Channel.fromPath ( './data/*.fastq')

ch_name = Channel.from('FAV_bc1','FAV_bc2','FAV_bc3','FAV_bc4','FAV_bc5','FAV_bc6','FAV_bc7','FAV_bc8','FAV_bc9','FAV_bc10','FAV_bc11','FAV_bc12')

workflow {

//nanoq(ch_name, files)
//fastqc(ch_name, files)
//kraken2(ch_name, files)
//nanofilt(ch_name, files)
//porechop(ch_name, files)
snikt(ch_name, files)
fastqc_snikt(ch_name, snikt.out.snikt_out)
//flye_nano(ch_name, nanofilt.out.nano_out) 
//flye_pore(ch_name, porechop.out.porechop_out)
flye_snikt(ch_name, snikt.out.snikt_out)
//medaka_nano(ch_name, files, flye_nano.out.flyenano_out)
//medaka_pore(ch_name, files, flye_pore.out.flyepore_out)
//medaka_snikt(ch_name, files, flye_snikt.out.flyesnikt_out)
//quast_nano(ch_name, flye_nano.out.flyenano_out)
//quast_pore(ch_name, flye_pore.out.flyepore_out)
quast_snikt(ch_name, flye_snikt.out.flyesnikt_out)
//prokka_nano(ch_name, flye_nano.out.flyenano_out)
//prokka_pore(ch_name, flye_pore.out.flyepore_out)prokka_snikt(ch_name, flye_snikt.out.flyesnikt_out) 
//antismash_nano(ch_name, flye_nano.out.flyenano_out)
//antismash_pore(ch_name, flye_pore.out.flyepore_out)
//antismash_snikt(ch_name, flye_snikt.out.flyesnikt_out)


}
