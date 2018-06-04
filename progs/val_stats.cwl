cwlVersion: v1.0
label: "Set operations on sets of lines"
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: ncbi/gpdev:latest
baseCommand: val_stats
inputs:
  annot_val: # -i
    type: File
    inputBinding:
      prefix: -i
  output_impl: # -o
    type: string
    default: annot.val.summary
    inputBinding:
      prefix: -o
  xml_impl: # -xml-output
    type: string
    default: annot.val.summary.xml
    inputBinding:
      prefix: -xml-output
  c_toolkit: # -xml-output
    type: boolean?
    inputBinding:
      prefix: -c-toolkit
outputs:
  output: # -o
    type: File
    outputBinding:
      glob: $(inputs.output_impl)
  xml: # -xml-output
    type: File
    outputBinding:
      glob: $(inputs.xml_impl)

  
  