# Response to Reviewer 3TGk’s Follow-up Comment 2

## 2. Computational cost, practical scalability, and intended use

We thank the reviewer for emphasizing this issue and apologize that our previous runtime report did not distinguish isolated pairwise latency from attainable workload throughput.

**Runtime clarification and throughput benchmark.** The previously reported runtime of (110.4 \pm 161.3) s per directed pair was measured sequentially, with only one pair evaluated at a time. It therefore reflects isolated latency on a substantially underutilized single L40S GPU—mean device utilization was approximately (6.5%)—rather than the attainable throughput for a full set of directed-pair evaluations. Consequently, the wall-clock time required to evaluate all directed pairs should not be estimated simply as (N(N-1)) times the per-pair latency, because multiple independent evaluations can be executed concurrently on the same GPU.

We now benchmark attainable workload throughput using the same Dual-flow implementation, with MATLAB’s `dlaccelerate` enabled and multiple independent pair evaluations scheduled concurrently on each GPU. We evaluated two workloads: (1) Rat BOLD, comprising 22 scans and two directed pairs per scan, for a total of 44 evaluations—the same workload used for the runtime report in our initial rebuttal; and (2) Mod10, a simulated dataset with modular organization, for which we selected 10 of the 50 realizations and evaluated all 90 directed pairs per realization, yielding 900 evaluations in total (Table Z1).

The concurrency setting was optimized on a single L40S GPU and then applied unchanged to each GPU in the four-L40S configuration. Each optimized one- and four-L40S benchmark was repeated five times using matched pair-level random seeds. Our prior sensitivity analysis showed that mean capacity estimates varied by at most (4.30%) across (T\in{256,512,1024,2048,4096}). We therefore standardized the throughput benchmarks at (T=256).

**Table Z1: Benchmarked workloads.**
| Dataset | Instances | Dimensions (ROIs × timepoints) | Pairs/instance | Evaluations/run | Runs |
|---|---:|---:|---:|---:|---:|
| Rat BOLD | 22 | 2 × 1000 | 2 | 44 | 5 |
| Mod10 | 10 | 10 × 300 | 90 | 900 | 5 |

**Table Z2. Throughput benchmark results.**
| Dataset | GPUs | Evaluations/run | Concurrent jobs/GPU | Wall time (s) | Amortized time/evaluation (s) | Speedup | Four-GPU efficiency | Mean GPU utilization |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Rat BOLD | 1×L40S | 44 | 1 (sequential, without dellaratory) | 6107 | 138.8 | 1.00× | — | 6.46%±2.61% |
| Rat BOLD | 1×L40S | 44 | 8 | 439.07±92.81 | 9.98±2.11 | 1.00× | — | 82.28%±2.49% |
| Rat BOLD | 4×L40S | 44 | 8 | 382.77±108.16 | 8.70±2.46 | 1.15× | 28.75% | 42.04%±2.47% |
| Mod10 | 1×L40S | 900 | 8 | 4707.00±581.45 | 5.23±0.65 | 1.00× | — | 77.32%±7.35% |
| Mod10 | 4×L40S | 900 | 8 | 1272.74±122.57 | 1.41±0.14 | 3.70× | 92.46% | 67.63%±5.66% |

Values are mean ± SD across five repetitions of each optimized workload; the original sequential Rat result is the previously reported single run. Multi-GPU speedup is calculated relative to the corresponding optimized 1×L40S configuration. For the 4×L40S configuration, GPU utilization is averaged across the four devices. In the seed-matched Rat comparison, enabling `dlaccelerate` and within-GPU concurrency reduced wall time from 6107 to 528 s, corresponding to an 11.6-fold increase in observed single-GPU throughput. Across the five optimized repetitions, mean wall time was (439.07\pm92.81) s, corresponding to an amortized runtime of (9.98\pm2.11) s per evaluation. Scaling to 4×L40S GPUs provided limited additional benefit for the small 44-evaluation Rat workload because scheduling and workload-partitioning overhead constituted a substantial fraction of total runtime. In contrast, the 900-evaluation Mod10 workload achieved a 3.70-fold speedup and 92.46% parallel efficiency using 4×L40S GPUs. At the level of an individual 10-ROI network, evaluating all 90 directed pairs required, on average, approximately 7.85 min on 1×L40S GPU and 2.12 min on 4×L40S GPUs. These execution settings reduce wall-clock time through improved hardware utilization; they do not reduce the estimator’s underlying computational work.

**Practical scope.** Nevertheless, Dual-flow nevertheless remains substantially more computationally demanding than GCap, GC, and LiNGAM. Exhaustive analysis requires N(N−1) directed-pair evaluations; concurrency and multi-GPU execution reduce wall-clock time but not total computation. Consistent with the limitation acknowledged in the original submission, the present implementation targets focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs of the whole-brain (Conclusion, Limitation). We will state this scope more prominently and avoid implying current whole-brain computational practicality.

**Scientific value of focused EC analysis.** Scalable whole-brain causal discovery and EC analysis of prespecified circuits serve complementary scientific aims. Focused EC analysis is an established neuroimaging use case. Smith et al. (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. Deshpande and Hu (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery; methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration (Bielczyk et al., *Network Neuroscience*, 2019; Rossini et al., *Clinical Neurophysiology*, 2019).

Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified using activation maps and neuroanatomical evidence, yielding 12 directed pairs. Within this intended setting, Dual-flow provides the distinct capability to estimate EC while incorporating non-Gaussian residual structure.

Dual-flow incurs greater cost because it models the empirical residual distribution without imposing Gaussianity and iteratively optimizes the input distribution for each directed pair.  In our controlled experiments, this richer modeling improved estimation accuracy at greater computational cost, illustrating the statistical-performance–computational-efficiency trade-off in learning and inference (Bottou and Bousquet, 2007; Chandrasekaran and Jordan, 2013). Accordingly, the present implementation targets focused EC analysis; unrestricted whole-brain deployment remains a direction for further computational optimization.
