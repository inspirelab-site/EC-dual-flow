# Response to Reviewer 3TGk's follow-up comment 2

## 2. Computational cost, practical scalability, and intended use

- **Clarification of the reported runtime.** We apologize that our previous runtime comparison did not provide sufficient information about GPU utilization. The reported (110.4±161.3)s per directed pair was measured under sequential processing, with only one pair evaluated at a time. This value therefore represents single-pair latency in the current implementation, not the time required by a computation that fully occupies an NVIDIA L40S. For example, one directed-pair evaluation (T=256) uses only approximately 6.89%+/-2.61% ($\in$[1%, 15%]) of the L40S GPU’s compute capacity. Thus, the sequential runtime should not be multiplied by N(N-1) to estimate attainable wall-clock time without accounting for within-GPU concurrency.
  We now provide additional runtime reports for two benchmark computations: 1) Rat BOLD data (as reported in the initial response, which has 44 directed pairs in total) and 2) the simulated Mod10 data (see Table Y). Both datasets are detailed in Table Z1. Given varying $T$, making the estimates largely stable (see our sensitivity analysis in the initial rebuttal), we set T=256 for all evaluations and repeat the computation for each benchmark dataset 5 times.

| Dataset | Data instances | Data dimensions/instance (ROIs × timepoints) | Directed pairs/instance | Evaluations/benchmark repetition | Benchmark repetitions |
|---|---:|---:|---:|---:|---:|
| Rat BOLD | 22 scans | 2x1000 | 2 | 44 | 5 |
| Mod10 | 10 simulated realizations | 10x300 | 90 | 900 | 5 |

**Initial one-GPU result.** Table Z2 compares sequential latency with optimized throughput on the 22-scan rat BOLD workload. The current values correspond to one completed benchmark run and will be replaced by the five-repetition summary when all repetitions are complete.

**Table Z2. Sequential latency and optimized throughput on one NVIDIA L40S (\(T=256\)).**

| Execution mode | `dlaccelerate` | Maximum concurrently scheduled pair evaluations | Total time for 44 evaluations | Amortized time per evaluation | Measured individual-pair latency | Throughput | Observed GPU-utilization range |
|---|---:|---:|---:|---:|---:|---:|---:|
| Original Sequential | Off | 1 | 6107 s | 138.8 s | (139+/-142)s s | 25.9 evaluations/hour | 6.89%+/-2.61% ($\in$[1%, 15%] |
| Throughput optimized (`parfor` + MPS) | On | 4 | 282 s | 6.4 s | Contended; not interpreted individually | 561.7 evaluations/hour | XXXX |

The (139+/-142)s value describes the distribution of individually measured sequential pair latencies. It is distinct from the amortized throughput value, which is calculated as total wall time divided by the number of completed evaluations. Under concurrent execution, individual pair latencies are contended and should not be interpreted as isolated per-pair computational costs.

The combined execution refinements reduced the total wall time from 6107 s to 282 s, corresponding to a 21.7 increase in system-level throughput on one L40S. This combined improvement should not be interpreted as reducing the estimator's total computational work by \(21.7\times\); it primarily converts previously unused GPU capacity into concurrent throughput. Dual-flow remains substantially more computationally expensive than the millisecond-scale comparison methods.

**Repeated one- and four-GPU throughput benchmarks.** We additionally measure the execution-stage wall time of the complete Rat BOLD and Modular10 workloads on one and four L40S GPUs. Each benchmark configuration is repeated five times. Each repetition uses a prespecified base seed from which a distinct deterministic seed is generated for every directed pair. Corresponding one- and four-GPU runs use the same five seed sets. Thus, repetition 1 uses identical pair-level seeds in the one- and four-GPU configurations, repetition 2 uses another matched seed set, and so forth. This prevents multi-GPU speedup from being confounded by differences in stochastic convergence workload.

**Table Z3. Execution-stage wall time across five complete benchmark repetitions (\(T=256\), `dlaccelerate` enabled).**

| Dataset | GPUs | Evaluations per repetition | Pair jobs scheduled concurrently | Rep. 1 | Rep. 2 | Rep. 3 | Rep. 4 | Rep. 5 | Mean \(\pm\) SD |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Rat BOLD | 1xL40S | 44 | 8 | 282 s | [ ] | [ ] | [ ] | [ ] | [ ] s |
| Rat BOLD | 4xL40S | 44 | 8/GPU; 32 total | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] s |
| Modular10 | 1xL40S | 900 | 8 | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] s |
| Modular10 | 4xL40S | 900 | 8/GPU; 32 total | [ ] | [ ] | [ ] | [ ] | [ ] | [ ] s |

The reported wall time covers the complete 44- or 900-evaluation of directed EC pair workload after the MATLAB workers and GPU devices have been initialized. Worker-pool creation and MPS initialization are excluded and will be reported separately if material.

**Table Z4. Summary of the repeated throughput benchmarks.**

| Dataset | GPUs | Total wall time (s) | Amortized time/evaluation | Throughput | Multi-GPU speedup (may or may not include) | Four-GPU efficiency | GPU utilization |
|---|---:|---:|---:|---:|---:|---:|---:|
| Rat BOLD | 1xL40S | [xx±xx] | [xx±xx] s | [xx±xx]/hour | 1.00 times | --- | [ ] |
| Rat BOLD | 4xL40S | [xx±xx] | [xx±xx] s | [xx±xx]/hour | [ ]times | [ ]% | [ ] |
| Mod10 | 1xL40S | [xx±xx]| [xx±xx] s | [xx±xx]/hour | 1.00 times | --- | [ ] |
| Mod10 | 4xL40S | [xx±xx] | [xx±xx] s | [xx±xx]/hour | [ ]times | [ ]% | [ ] |

For each dataset, multi-GPU speedup is defined as

\[
\mathrm{Speedup}_{4\mathrm{GPU}}
=
\frac{\text{optimized wall time on one L40S}}
{\text{optimized wall time on four L40S GPUs}},
\]

and four-GPU efficiency is

\[
\mathrm{Efficiency}_{4\mathrm{GPU}}
=
\frac{\mathrm{Speedup}_{4\mathrm{GPU}}}{4}\times100\%.
\]

GPU utilization is measured device-wide using NVIDIA’s utilization metric over the timed execution interval. For the four-GPU configuration, we will report the time-weighted utilization for each device and its aggregate summary rather than treating overlapping pair windows as independent measurements.


- **Acknowledged limitation and intended practical scope.** This computational limitation was already acknowledged in the original submission: “computational cost may limit scalability to larger datasets.” The present implementation is intended for focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs among hundreds of ROIs. We will state this intended scope more prominently in the revised manuscript and avoid implying whole-brain computational practicality. Further computational optimization remains an important direction.

- **Scientific value of focused EC analysis.** We agree that whole-brain causal discovery is an important methodological objective. In parallel,  prespecified circuits is an established EC use case in with broad practical neuroimaging utility. [Smith et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3260563/) (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. [Deshpande and Hu](https://doi.org/10.1089/brain.2012.0091) (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration ([Bielczyk et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370462/), *Network Neuroscience*, 2019; [Rossini et al.](https://doi.org/10.1016/j.clinph.2019.06.006), *Clinical Neurophysiology*, 2019).

  Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified from activation maps and neuroanatomical evidence, restricting inference to 12 directed pairs. Within this intended setting, distribution-aware modeling of non-Gaussian residuals provides a distinct methodological capability, although the current implementation is not designed for unrestricted whole-brain discovery.

In summary, the previous benchmark measured sequential single-pair latency under substantial GPU underutilization. The new benchmark measures attainable single-GPU throughput and achieves a 21.7-fold wall-clock reduction through acceleration and within-GPU concurrency. Dual-flow nevertheless remains more computationally demanding because it models the empirical residual distribution without imposing Gaussianity and iteratively optimizes the input distribution for each directed pair, thereby incorporating non-Gaussian and higher-order structure beyond Gaussian or second-order characterizations. In our controlled experiments, this richer modeling improved estimation accuracy at greater computational cost, illustrating the statistical-performance–computational-efficiency trade-off in learning and inference (Bottou and Bousquet, 2007; Chandrasekaran and Jordan, 2013). Accordingly, the present implementation targets focused, prespecified circuit analysis; unrestricted whole-brain deployment was not an objective of this study and remains a direction for future computational optimization.
