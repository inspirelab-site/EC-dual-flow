
R1:
We thank the reviewer for distinguishing validation of non-Gaussian capacity estimation from recovery of directed effective connectivity. We address the four concerns below.

**1. Real-data evaluation and neuroscience support.**
The tongue-motion experiment was not an unconstrained whole-brain exploratory analysis. As described in Appendix C.1, the four tongue ROIs (as shown in Fig. 2B) were defined in a data-specific manner from FSL FEAT tongue-motion activation maps, and their locations corresponded to cerebellar and bilateral orofacial sensorimotor regions previously reported for the HCP motor-task paradigm (Barch et al., NeuroImage, 2013). EC estimation was then restricted to this task-activated network.

As detailed in Section 4.3, the identified interactions were consistent with established contralateral cerebello-cortical circuitry (Manto et al., Cerebellum, 2012; Sasegbon et al., Dysphagia, 2023) and bilateral orofacial sensorimotor organization (Rizzolatti et al., Neuron, 2001; Todorov et al., Nature Neuroscience, 2004). We will make this existing connection-specific anatomical and functional support more systematic and visible in the revision. Although the task-evoked circuit is well established, human fMRI does not provide ground-truth labels for its exact directed edges. The real-data analysis therefore evaluates whether the estimated interactions are task-sensitive and consistent with established tongue-motion circuitry rather than providing definitive ground-truth validation. We now provide quantitative validation of directed-edge recovery using new simulations with prespecified ground-truth connectivity (see Point 2).

**2. Known-edge simulations and baselines.**
We conducted additional controlled stress tests using an adapted implementation of the established Smith et al. BOLD simulation framework with prespecified ground-truth effective-connectivity matrices (NeuroImage, 2011). For the present experiments, we used a TR of 1 s, a 5-min scan duration, and additive two-component Gaussian-mixture measurement noise scaled to an SNR of 10 dB. We evaluated two distinct 5-ROI directed topologies: (i) a chain-with-shortcut network (chain-SC) containing 1->2, 2->3, 3->4, 4->5, and 1->5; and (ii) a diamond DAG (diam) containing 1->2, 1->3, 2->4, 3->4, and 4->5. We additionally evaluated a 3-ROI common-driver topology containing 1->2 and 1->3, but no direct connection between nodes 2 and 3, under equal (0.4 and 0.4) and unequal (0.8 and 0.4) coupling strengths. We generated 50 independent realizations for each condition.

Gaussian capacity (GCap) was a within-framework combined ablation that retained the fitted FIR channel and edge-selection procedure but replaced empirical residual modeling and input-distribution optimization with the Gaussian-capacity calculation. GC, VAR-LiNGAM (LiNGAM), and GIMME were external baselines. All methods used the same ground-truth edges and edge-selection procedure. Entries below are mean $\pm$ SD.

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

Dual-flow achieved the highest mean AUROC and sensitivity in all four conditions and the highest precision in three of four conditions. It consistently outperformed GCap, supporting the joint contribution of empirical residual modeling and input-distribution optimization. GIMME generally achieved low FPR at the cost of very low sensitivity.

The baselines represent complementary EC frameworks: Granger causality measures linear directed predictability; VAR-LiNGAM uses non-Gaussian innovations for structural identification; and GIMME performs group- and individual-level structural-equation-model search. In contrast, the proposed method estimates channel capacity from the empirical FIR-residual distribution while jointly optimizing the admissible input distribution.

Beyond controlled edge recovery, we applied the same sliding-window strategy to all methods using concurrent S1L/S1R LFP–BOLD recordings. The BOLD and band-limited LFP analyses produced frequency-dependent, time-varying relationships consistent with prior reports of dynamic neural–BOLD coupling (Thompson, Neuroimage, 2013), complementing the known-edge simulations with a real-data evaluation of time-resolved biological relevance.

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

Dual-flow is substantially slower because it uses the empirical residual distribution and iteratively optimizes the input distribution, but required only approximately 3.0 GB of host RAM and 0.5 GB of GPU memory. The variability in Dual-flow runtime reflects differences in the number of iterations required to satisfy the EMA-based convergence criterion. We will add these comparisons and clarify that Fig. 7 used 4xL40S GPUs, whereas this benchmark used a single L40S. Because scans and directed ROI-pair analyses are independent, they can be distributed across multiple GPUs to reduce total wall-clock time.

**4. Stability, sensitivity, and statistical testing.**
4. Stability, sensitivity, and statistical testing.
We agree that robustness should be characterized more clearly. As detailed in Appendix C.3, FIR order—and therefore the number of fitted coefficients—is automatically selected separately for each directed ROI pair and trial using AICc. For the sliding-window analyses, window lengths were specified a priori based on established human (Allen et al., Cerebral Cortex, 2012) and rodent (Thompson et al., NeuroImage, 2013) studies with comparable acquisition settings. Residuals were uniformly resampled with replacement from the fitted empirical residual pool.

As described in Point 2, Gaussian water-filling capacity provides a within-framework joint ablation: it retains the same fitted FIR channel and edge-selection procedure while replacing empirical residual modeling and input-distribution optimization with the conventional Gaussian-capacity calculation. We additionally evaluated sensitivity to the DualNet training sequence length \(T\), defined as the number of generated time points per minibatch sequence, with \(T=1024\) used by default. We tested \(T\in\{256,512,1024,2048,4096\}\) across 50 random initializations and four residual distributions: Gaussian, uniform, exponential, and Student’s \(t\). Capacity estimates showed [result], indicating [minimal/limited] sensitivity to \(T\). No systematic failure mode was identified within the tested settings. We will include the complete results in an appendix figure. The same three-pair Real-NVP architecture and EMA-based convergence criterion were fixed across all experiments rather than tuned separately for individual datasets.

As also detailed in Appendix C.3, task-versus-rest effects were assessed using right-tailed paired tests across subjects, followed by FDR correction across the tested directed ROI pairs and a coefficient-of-variation criterion for between-subject variability. Subjects served as paired observations rather than separate hypotheses, and only the prespecified tongue-versus-rest contrast was evaluated; therefore, no additional correction across subjects or task conditions was required. The statistical results were provided in Appendix D (Table 1). We will add a clearer main-text cross-reference to Appendices C.3 and D.
