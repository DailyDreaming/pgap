cwlVersion: v1.0
label: "Execute CRISPR, execution"
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: ncbi/bacterial_mobile_elem:pgap4.4

requirements:
  - class: InitialWorkDirRequirement
    listing:
      - entry: $(inputs.asn_cache)
        writable: True

#ncbi_crisper_wnode -asn-cache sequence_cache -ncbi-crisper-path /opt/crispr/1.0/bin/ -input-jobs jobs.xml
baseCommand: ncbi_crisper_wnode
inputs:
  asn_cache:
    type: Directory
    inputBinding:
      prefix: -asn-cache
  input_jobs:
    type: File
    inputBinding:
      prefix: -input-jobs
  crisper_path:
    type: string?
    default: /opt/crispr/1.0/bin/
    inputBinding:
      prefix: -ncbi-crisper-path
  output_dir:
    type: string?
    default: output
    inputBinding:
      prefix: -O
outputs:
  asncache:
    type: Directory
    outputBinding:
      glob: $(inputs.asn_cache.basename)
  outdir:
    type: Directory
    outputBinding:
      glob: $(inputs.output_dir)
  
  