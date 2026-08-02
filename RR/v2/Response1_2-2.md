# Response to Reviewer 3TGk's follow-up comment 2

## 2. Computational cost, practical scalability, and intended use

- **Clarification of the reported runtime.** We apologize that our previous runtime comparison did not provide sufficient information about GPU utilization. The reported (110.4±161.3)s per directed pair was measured at T=1024 under sequential processing, with only one pair evaluated at a time. This value therefore represents single-pair latency in the current implementation, not the time required by a computation that fully occupies an NVIDIA L40S. Runtime per pair is broadly comparable across the evaluated values ($T\in${256, 512, 1024, 2048, 4096}), but the GPU resources used by a single evaluation differ substantially with (T). For example, at (T=512), one directed-pair evaluation uses only approximately 1–3% of the L40S GPU’s compute capacity. Thus, the sequential runtime should not be multiplied by N(N-1) to estimate attainable wall-clock time without accounting for within-GPU concurrency.

| T | Execution | Concurrent pairs | Total time for 44 evaluations (s) | Amortized time/evaluation (s) | GPU utilization |
|---:|---|---:|---:|---:|---:|
| 256 | Sequential baseline | 1 | 6107 | 139 | avg. xx%+/-xx%, [1%, 15%] |
| 256 | Throughput optimized | 4 | 282 | 6.4 | [44%, 90%] |
| 512 | Sequential baseline | 1 | 5218 | 119 | [1%, 20%] |
| 512 | Throughput optimized | 8 | 455 | 10.3 | [46%, 96%] |
| 1024 | Sequential baseline | 1 | 3897 | 89 | [2%, 49%] |
| 1024 | Throughput optimized | 16 | 770 | 17.5 | [52%, 94%] |
| 2048 | Sequential baseline | 1 | xx | xx | [x%, x%] |
| 2048 | Throughput optimized | 4 | 1637 | 37.2 | [48%, 98%] |

  The expanded simulations used (T=512) for networks with at most 10 observed ROIs and (T=256) for the 28-ROI network. These smaller settings do not substantially reduce single-pair latency, but they reduce the resources used by each evaluation and permit more independent directed-pair evaluations to be executed concurrently on the same GPU. This improves potential system-level throughput but does not remove the (N(N-1)) growth in the number of directed-pair evaluations.

- **Acknowledged limitation and intended practical scope.** This computational limitation was already acknowledged in the original submission: “computational cost may limit scalability to larger datasets.” The present implementation is intended for focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs among hundreds of ROIs. We will state this intended scope more prominently in the revised manuscript and avoid implying whole-brain computational practicality. Further computational optimization remains an important direction.

- **Scientific value of focused EC analysis.** We agree that whole-brain causal discovery is an important methodological objective. In parallel,  prespecified circuits is an established EC use case in with broad practical neuroimaging utility. [Smith et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3260563/) (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. [Deshpande and Hu](https://doi.org/10.1089/brain.2012.0091) (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration ([Bielczyk et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370462/), *Network Neuroscience*, 2019; [Rossini et al.](https://doi.org/10.1016/j.clinph.2019.06.006), *Clinical Neurophysiology*, 2019).

  Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified from activation maps and neuroanatomical evidence, restricting inference to 12 directed pairs. Within this intended setting, distribution-aware modeling of non-Gaussian residuals provides a distinct methodological capability, although the current implementation is not designed for unrestricted whole-brain discovery.

In summary, Dual-flow provides a distribution-aware EC estimator validated across diverse controlled network conditions and intended for focused, prespecified circuit analysis. The results demonstrate a clear statistical-performance–computational-efficiency trade-off; exhaustive whole-brain deployment is not yet computationally practical and remains a target for further optimization.


