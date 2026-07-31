# Response to Reviewer 3TGk's follow-up comment 2

## 2. Computational cost, practical scalability, and intended use

- **Clarification of the reported runtime.** We apologize for the confusion caused by our previous runtime comparison. The reported 110.4 s per directed pair used (T=1024), but we failed to explain that that runtime depends strongly on the choice of T. As reported in our preceding response, capacity estimates showed limited sensitivity across \(T\in\{256,512,1024,2048,4096\}\), with mean differences from \(T=1024\) of at most 4.30%. We now report runtime across these settings in Table Z. The expanded simulations used \(T=512\) for networks with at most 10 observed ROIs and \(T=256\) for the 28-ROI network, substantially reducing computation and enabling the larger-network evaluation. This improves practical scalability but does not remove the \(N(N-1)\) growth in the number of directed-pair evaluations.

  **[Insert runtime-by-\(T\) table here.]**

- **Acknowledged limitation and intended practical scope.** We agree that the current Dual-flow implementation is not computationally practical for exhaustive whole-brain analysis. Even with smaller \(T\), it remains substantially slower per directed pair than GCap, GC, and LiNGAM. Exhaustive analysis requires \(N(N-1)\) evaluations, and multi-GPU parallelization reduces wall-clock time but not total computation. The added measurements quantify the limitation already stated in the original submission: “computational cost may limit scalability to larger datasets.” The present implementation is therefore intended for focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs among hundreds of ROIs.

- **Scientific value of focused EC analysis.** Limited whole-brain scalability does not preclude practical neuroimaging utility. Analysis of prespecified circuits is an established EC use case. [Smith et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3260563/) (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. [Deshpande and Hu](https://doi.org/10.1089/brain.2012.0091) (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration ([Bielczyk et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370462/), *Network Neuroscience*, 2019; [Rossini et al.](https://doi.org/10.1016/j.clinph.2019.06.006), *Clinical Neurophysiology*, 2019).

  Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified from activation maps and neuroanatomical evidence, restricting inference to 12 directed pairs. Within this intended setting, distribution-aware modeling of non-Gaussian residuals provides a distinct methodological capability, although the current implementation is not designed for unrestricted whole-brain discovery.

- **Future scalability.** We will state this intended scope more prominently and avoid implying current whole-brain computational practicality. Further computational optimization remains an important direction.

In summary, Dual-flow provides a distribution-aware EC estimator validated across diverse controlled network conditions and intended for focused, prespecified circuit analysis. The results demonstrate a clear statistical-performance–computational-efficiency trade-off; exhaustive whole-brain deployment is not yet computationally practical and remains a target for further optimization.


