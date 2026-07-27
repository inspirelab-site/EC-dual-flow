
R1:
We thank the reviewer for distinguishing validation of non-Gaussian capacity estimation from recovery of directed effective connectivity. We address the four concerns below.

**1. Real-data validation.**
The tongue-motion experiment was a literature-constrained known-pathway analysis, not an unconstrained exploratory analysis. The expected pathways included contralateral cerebello-cortical and bilateral orofacial sensorimotor interactions [refs]. We will state these hypotheses before presenting the estimates, strengthen their anatomical support, and clarify the statistical criterion for the starred edges. Because human fMRI cannot provide invasive ground truth for every connection, exact known-edge validation is provided by the simulations below.

**2. Known-edge simulations and baselines.**
We conducted additional controlled stress tests using an adapted implementation of the established Smith et al. BOLD simulation framework with prespecified ground-truth effective-connectivity matrices (NeuroImage, 2011). For the present experiments, we used a TR of 1 s, a 5-min scan duration, and additive two-component Gaussian-mixture measurement noise scaled to an SNR of 10 dB. We evaluated two distinct 5-ROI directed topologies: (i) a chain-with-shortcut network (chain-SC) containing 1->2, 2->3, 3->4, 4->5, and 1->5; and (ii) a diamond DAG (diam) containing 1->2, 1->3, 2->4, 3->4, and 4->5. We additionally evaluated a 3-ROI common-driver topology containing 1->2 and 1->3, but no direct connection between nodes 2 and 3, under equal (0.4 and 0.4) and unequal (0.8 and 0.4) coupling strengths. We generated 50 independent realizations for each condition.

Gaussian capacity (GCap) was a within-framework combined ablation retaining the fitted FIR channel and edge-selection procedure but replacing empirical residual modeling and input-distribution optimization with the Gaussian-capacity calculation. GC, VAR-LiNGAM (LiNGAM), and GIMME were external baselines. All methods used the same ground-truth edges and edge-selection procedure. Entries below are mean $\pm$ SD.

| Net | Method | AUROC | Precision | Sensitivity | FPR |
|---|---|---:|---:|---:|---:|
| CD-e | Dual-flow | .925 ± .186 | .893 ± .223 | .900 ± .226 | .070 ± .152 |
|  | Gcap | .466 ± .353 | .387 ± .420 | .350 ± .381 | .290 ± .210 |
|  | LiNGAM | .683 ± .342 | .560 ± .395 | .610 ± .408 | .260 ± .247 |
|  | GIMME | .498 ± .018 | .000 ± .000 | .000 ± .000 | .005 ± .035 |
|  | GC | .528 ± .293 | .383 ± .286 | .490 ± .357 | .410 ± .207 |
| CD-u | Dual-flow | .910 ± .168 | .873 ± .222 | .790 ± .249 | .075 ± .136 |
|  | Gauss-cap | .405 ± .310 | .287 ± .404 | .210 ± .287 | .275 ± .184 |
|  | LiNGAM | .690 ± .352 | .590 ± .390 | .630 ± .414 | .235 ± .223 |
|  | GIMME | .750 ± .000 | 1.000 ± .000 | .500 ± .000 | .000 ± .000 |
|  | GC | .485 ± .297 | .327 ± .301 | .390 ± .354 | .400 ± .202 |
| Chain | Dual-flow | .895 ± .109 | .691 ± .155 | .828 ± .167 | .136 ± .082 |
|  | GCap | .492 ± .144 | .310 ± .180 | .320 ± .198 | .224 ± .084 |
|  | LiNGAM | .684 ± .195 | .460 ± .201 | .580 ± .219 | .248 ± .120 |
|  | GIMME | .522 ± .051 | .230 ± .419 | .052 ± .097 | .008 ± .022 |
|  | GC | .506 ± .118 | .251 ± .093 | .380 ± .158 | .379 ± .094 |
| Diam. | Dual-flow | .888 ± .101 | .653 ± .135 | .836 ± .170 | .156 ± .077 |
|  | GCap | .553 ± .180 | .379 ± .211 | .412 ± .215 | .241 ± .111 |
|  | LiNGAM | .717 ± .140 | .499 ± .149 | .640 ± .185 | .227 ± .096 |
|  | GIMME | .505 ± .032 | .040 ± .198 | .012 ± .063 | .003 ± .013 |
|  | GC | .564 ± .199 | .304 ± .164 | .484 ± .259 | .376 ± .108 |

Dual-flow achieved the highest mean AUROC and sensitivity in all four conditions and the highest precision in three. It consistently outperformed GCap, supporting the combined contribution of empirical residual modeling and input-distribution optimization. GIMME's lower FPR was generally accompanied by very low sensitivity.

The baselines make complementary assumptions: GC measures linear directed predictability, VL uses non-Gaussian innovations for structural identification, and GIMME performs structural-equation-model search. Our method instead estimates capacity from the empirical FIR residual distribution while optimizing the admissible input distribution.

We also applied the same sliding-window strategy to all methods using concurrent S1L/S1R LFP-BOLD recordings. Analyses of BOLD and band-limited LFP power produced frequency-dependent, time-varying relationships consistent with dynamic neural-BOLD coupling [refs], complementing the controlled known-edge results.

**3. Computational cost.**
We measured per-scan runtime and peak memory using sequential processing. Dual-flow used one NVIDIA L40S GPU; the CPU methods ran on the same system. Per-scan rather than total runtime is reported because total wall time depends on dataset size and parallelization. Values are mean $\pm$ SD where available.
Time is seconds per scan; memory is MB. Values are mean±SD.

| Method | Time (s)/Scan | RAM (MB) | GPU (MB) |
|---|---|---|---|
| Dual-flow | 110.4±161.3 | 2961 | 496 |
| Gauss-cap | .004±.000 | 1661 | -- |
| GC | .006±.023 | 1569 | -- |
| VAR-LiNGAM | .003±.000 | 268 | -- |
| GIMME | .364 | 423 | -- |

Dual-flow is substantially slower because it uses the empirical residual distribution and iteratively optimizes the input distribution, but required only approximately 3.0 GB of host RAM and 0.5 GB of GPU memory. We will add these results and clarify that Fig.~7 used four L40S GPUs, whereas this benchmark used one. Independent scans can be distributed across GPUs to reduce total runtime.

**4. Stability and sensitivity.**
FIR order is selected automatically for each ROI pair and window using an information criterion; we will report its distribution. Window lengths follow prior human and rodent studies with comparable acquisition settings.

We also evaluated DualNet sequence length $T\in\{256,512,1024,2048,4096\}$ across 60 initializations and six residual distributions. Capacity estimates showed [insert result], indicating [limited/minimal] sensitivity to $T$. We will include these results in an appendix figure. The architecture and EMA convergence criterion were fixed across experiments. We will also report cross-subject pathway consistency [XX] and clarify that significance was assessed using FDR correction across directed ROI pairs.
<img width="468" height="637" alt="image" src="https://github.com/user-attachments/assets/5cc4a52a-2aee-4f68-add1-1809aa09bd3d" />
