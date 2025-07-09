# Genomic Bacterial Analysis Pipeline with Nextflow

## Overview
This Nextflow pipeline provides a comprehensive genomic analysis workflow that integrates:
- Quality control for sequencing data
- Taxonomy classification
- Long-read and short-read assembly
- Genome polishing and evaluation
- Functional annotation

The pipeline is modular, allowing flexible execution of specific analysis steps or the entire workflow.

## Pipeline Modules

### Quality Control
- `nanoq`: Fast quality control for nanopore reads
- `falco_pre`: Quality control with Falco
- `porechop`: Adapter trimming for nanopore reads
- `snikt`: Filtering and trimming
- `fastqc`: Quality control reports

### Taxonomy Classification
- `kraken2`: Taxonomic classification using Kraken2
- `kaiju`: Fast taxonomic classification

### Long-Read Assembly
- `flye`: De novo assembly of long reads
- `medaka`: Consensus sequence improvement
- `quast_lr`: Assembly evaluation (pre/post polishing)
- `busco_lr`: Genome completeness assessment

### Short-Read Assembly
- `unicycler`: Hybrid assembly pipeline
- `pilon`: Genome improvement
- `quast_sr`: Assembly evaluation (pre/post polishing)
- `busco_sr`: Genome completeness assessment

### Annotation
- `pgap`: NCBI Prokaryotic Genome Annotation Pipeline
- `prokka`: Rapid prokaryotic genome annotation
- `antismash`: Secondary metabolite cluster detection
- `barrnap`: rRNA gene prediction
- `mob_recon`: Mobile genetic element analysis
- `trnascan`: tRNA gene detection

## Installation
1. Install Nextflow:
```bash
curl -s https://get.nextflow.io | bash
```

2. Clone this repository:
```bash
git clone https://github.com/yourusername/genomic-analysis-pipeline.git
cd genomic-analysis-pipeline
```

3. Install dependencies (Docker/Singularity recommended):
```bash
nextflow pull
```

## Configuration
Configure pipeline parameters in `nextflow.config`:
```nextflow
params {
    THREADS = 8
    BARCODE_THRESHOLD = 75
    LINEAGE = "bacteria"
    KINGDOM = "Bacteria"
    MODEL = "r941_min_high_g360"
    FILTER = "mean_q=10:length=1000"
    TRIM5 = 50
    TRIM3 = 50
}
```

## Usage
Place input FASTQ files in `./data/` directory

Run entire pipeline:
```bash
nextflow run main.nf
```

Run specific modules (e.g., quality control and taxonomy):
```bash
nextflow run main.nf -entry quality_control
```

## Key Parameters
| Parameter | Default | Description |
|-----------|---------|-------------|
| THREADS | 8 | Number of CPU threads |
| BARCODE_THRESHOLD | 75 | Barcode identification threshold |
| LINEAGE | "bacteria" | BUSCO lineage dataset |
| KINGDOM | "Bacteria" | Taxonomic kingdom |
| MODEL | "r941_min_high_g360" | Medaka model for polishing |
| FILTER | "mean_q=10:length=1000" | Read filtering criteria |
| TRIM5 | 50 | 5'-end trimming length |
| TRIM3 | 50 | 3'-end trimming length |

## Output Structure
```
results/
├── quality_control/
├── taxonomy/
├── long_read_assembly/
├── short_read_assembly/
└── annotation/
```

## Dependencies
- Nextflow >= 22.04.0
- Docker/Singularity (recommended)
- Python >= 3.7
- All module-specific dependencies are handled through containers

## Author
Ana Amaral & Sergio Litwiniuk,
GIGA-lab

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
