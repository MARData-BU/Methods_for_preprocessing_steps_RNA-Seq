# Preprocessing steps in RNA-Seq

This repository provides scripts used in the study titled _The Importance of Data Transformation in RNA-Seq Preprocessing for Bladder Cancer Subtyping (BMC Research Note ID)_. Within this repository, the scripts are organized according to the preprocessing steps outlined below:


* **1-Quality Control (QC)** : Quality control (QC) is the first step applied immediately after the obtaintion of the data. In the QC step, samples with low quality due to sequencing errors can be identified. These samples often have characteristics that could compromise the accuracy of downstream analysis results.

* **2-Alignment** : The following step of preprocessing is the alignment of the reads to a reference genome or transcriptome. Tools like STAR (_Dobin, A. et al 2013_) or Hisat2 (_Kim, D. et al 2019_) , among others, are commonly used for this purpose.

* **3-Quantification** : After alignment, the number of reads aligned is quantified to determine the gene expression levels. Tools like featureCounts (_Liao Y. et al 2014_),  HTSeq (_Anders, S. et al 2015_) or  StringTie (_Pertea, M. et al 2015_) are widely used to estimate the expression levels in a sample

* **4-Pseudoalignment** : Although alignment and quantification are typically performed as separate steps, pseudoaligners represent a modern and efficient approach to assess gene expression. While traditional aligners map each read to an exact location, pseudoaligners estimate the compatibility of reads without requiring base-to-base alignment. Subsequently, they perform gene expression estimation. This approach significantly reduces computational time and resource requirements while preserving accuracy. Kallisto (_Bray, N. et al 2016_) and  Salmon (_Patro, R. et al 2017_)  are the most widely utilized tools for this purpose.


# Bibliography

  _Anders, S., Pyl, P. T., & Huber, W. (2015). HTSeq—a Python framework to work with high-throughput sequencing data. Bioinformatics, 31(2), 166–169. https://doi.org/10.1093/bioinformatics/btu638_
  
  _Bray, N. L., Pimentel, H., Melsted, P., & Pachter, L. (2016). Near-optimal probabilistic RNA-seq quantification. Nature Biotechnology, 34(5), 525–527. https://doi.org/10.1038/nbt.3519_
  
  _Dobin, A., Davis, C. A., Schlesinger, F., Drenkow, J., Zaleski, C., Jha, S., Batut, P., Chaisson, M., & Gingeras, T. R. (2013). STAR: ultrafast universal RNA-seq aligner. Bioinformatics, 29(1), 15–21. https://doi.org/10.1093/bioinformatics/bts635_
  
  _Kim, D., Paggi, J. M., Park, C., Bennett, C., & Salzberg, S. L. (2019). Graph-based genome alignment and genotyping with HISAT2 and HISAT-genotype. Nature Biotechnology, 37(8), 907–915. https://doi.org/10.1038/s41587-019-0201-4_
  
  _Liao, Y., Smyth, G. K., & Shi, W. (2014). featureCounts: an efficient general purpose program for assigning sequence reads to genomic features. Bioinformatics, 30(7), 923–930. https://doi.org/10.1093/bioinformatics/btt656_
  
  _Patro, R., Duggal, G., Love, M. I., Irizarry, R. A., & Kingsford, C. (2017). Salmon provides fast and bias-aware quantification of transcript expression. Nature Methods, 14(4), 417–419. https://doi.org/10.1038/nmeth.4197_
  
  _Pertea, M., Pertea, G. M., Antonescu, C. M., Chang, T.-C., Mendell, J. T., & Salzberg, S. L. (2015). StringTie enables improved reconstruction of a transcriptome from RNA-seq reads. Nature Biotechnology, 33(3), 290–295. https://doi.org/10.1038/nbt.3122_


