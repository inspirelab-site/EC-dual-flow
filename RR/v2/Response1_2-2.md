# Response to Reviewer 3TGk’s Follow-up Comment 2

## 2. Computational cost, practical scalability, and intended use

We thank the reviewer for emphasizing this issue and apologize that our previous runtime report did not distinguish isolated pairwise latency from attainable workload throughput.

**Runtime clarification and throughput benchmark.** The previously reported runtime of (110.4±161.3) s per directed pair was measured sequentially, with only one pair evaluated at a time. It therefore reflects isolated latency on a substantially underutilized single L40S GPU—mean device utilization was approximately (6.5%)—rather than the attainable throughput for a full set of directed-pair evaluations. Consequently, the wall-clock time required to evaluate all directed pairs should not be estimated simply as N(N-1) times the per-pair latency, because multiple independent evaluations can be executed concurrently on the same GPU.

We now benchmark attainable workload throughput using the same Dual-flow implementation, with MATLAB’s `dlaccelerate` enabled and multiple independent pair evaluations scheduled concurrently on each GPU. We evaluated two workloads: (1) Rat BOLD, comprising 22 scans and two directed pairs per scan, for a total of 44 evaluations—the same workload used for the runtime report in our initial rebuttal; and (2) Mod10, a simulated dataset with modular organization, for which we selected 10 of the 50 realizations and evaluated all 90 directed pairs per realization, yielding 900 evaluations in total (Table Z1).

The concurrency setting was optimized on a single L40S GPU and then applied unchanged to each GPU in the four-L40S configuration. Each optimized one- and four-L40S benchmark was repeated five times using matched pair-level random seeds. Our prior sensitivity analysis showed that mean capacity estimates varied by at most (4.30%) across (T\in{256,512,1024,2048,4096}). We therefore standardized the throughput benchmarks at (T=256).

**Table Z1: Benchmarked workloads.**
| Dataset | Instances | Dimensions (ROIs × timepoints) | Pairs/instance | Evaluations/run | Runs |
|---|---:|---:|---:|---:|---:|
| Rat BOLD | 22 | 2 × 1000 | 2 | 44 | 5 |
| Mod10 | 10 | 10 × 300 | 90 | 900 | 5 |

**Table Z2. Throughput benchmark results.**
| Dataset | GPUs | Evaluations/run | Concurrent jobs/GPU | Wall time (s) | Amortized time/evaluation (s) | Relative Speedup | 4×L40S efficiency | Mean GPU utilization |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Rat BOLD | 1×L40S | 44 | 1 (sequential, w/o `dlaccelerate`) | 6107 | 138.8 | 1.00× | — | 6.46%±2.61% |
| Rat BOLD | 1×L40S | 44 | 8 | 439.07±92.81 | 9.98±2.11 | 1.00× | — | 82.28%±2.49% |
| Rat BOLD | 4×L40S | 44 | 8 | 382.77±108.16 | 8.70±2.46 | 1.15× | 28.75% | 42.04%±2.47% |
| Mod10 | 1×L40S | 900 | 8 | 4707.00±581.45 | 5.23±0.65 | 1.00× | — | 77.32%±7.35% |
| Mod10 | 4×L40S | 900 | 8 | 1272.74±122.57 | 1.41±0.14 | 3.70× | 92.46% | 67.63%±5.66% |

Values are mean ± SD across five optimized repetitions; the original sequential Rat result matches the previously reported single run. In a seed-matched Rat comparison, the throughput-optimized configuration reduced wall time from 6107 to 528 s, corresponding to an 11.6-fold increase in single-GPU throughput. The small Rat workload benefited little from 4×L40S GPUs because overhead dominated, whereas Mod10 achieved a 3.70-fold speedup and 92.46% parallel efficiency, reducing evaluation of all 90 directed pairs in a 10-ROI network from 7.85 to 2.12 min. These executions reduce wall-clock time through improved hardware utilization but do not reduce the underlying computational work.

**Acknowledged limitation and intended practical scope.** We agree that improved hardware utilization reduces wall-clock time without changing the underlying computational workload. As acknowledged in the original submission, computational cost limits scalability to larger analyses. The new benchmarks clarify the practical operating scale of the current implementation: focused analysis of prespecified circuits and moderately sized subnetworks, including the simulated networks evaluated here with up to 28 observed ROIs, rather than unrestricted all-to-all analysis among hundreds of whole-brain ROIs. We will revise the Conclusion and Limitations to make this intended scope explicit.

**Scientific value of focused EC analysis.** We agree that scalable whole-brain causal discovery is an important methodological objective. In parallel, EC analysis of prespecified circuits is an established use case with broad practical utility in neuroimaging. Smith et al. (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. Deshpande and Hu (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration (Bielczyk et al., *Network Neuroscience*, 2019; Rossini et al., *Clinical Neurophysiology*, 2019).

Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were predefined using task-activation maps and neuroanatomical evidence, yielding 12 directed pairs. Dual-flow incorporates non-Gaussian residual structure by modeling the empirical residual distribution and iteratively optimizing the input distribution for each directed pair. In our controlled experiments, this richer modeling produced substantially stronger overall directed-edge recovery at greater computational cost, illustrating a statistical-performance–computational-efficiency trade-off. Accordingly, the current implementation targets focused EC analysis of predefined circuits and moderately sized subnetworks; unrestricted whole-brain deployment remains a direction for future computational optimization.
