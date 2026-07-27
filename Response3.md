We thank the reviewer and address the four concerns and related questions below.

**1. Real-data evaluation and neuroscience support.**
The tongue-motion experiment was not an unconstrained whole-brain exploratory analysis. As described in Appendix C.1, the four tongue ROIs in Fig. 2B were defined from data-specific FSL FEAT activation maps and corresponded to cerebellar and bilateral orofacial sensorimotor regions reported for the HCP motor task (Barch et al., 2013); effective connectivity (EC) estimation was restricted to this network.

As detailed in Section 4.3, the identified interactions were consistent with established contralateral cerebello-cortical circuitry (Manto et al., Cerebellum, 2012; Sasegbon et al., Dysphagia, 2023) and bilateral orofacial sensorimotor organization (Rizzolatti et al., Neuron, 2001; Todorov et al., Nature Neuroscience, 2004). We will make this existing connection-specific anatomical and functional support more systematic and visible in the revision. Although the task-evoked circuit is well established, human fMRI does not provide ground-truth labels for its exact directed edges. The real-data analysis therefore evaluates whether the estimated interactions are task-sensitive and consistent with established tongue-motion circuitry rather than providing definitive ground-truth validation. We now provide quantitative validation of directed-edge recovery using new simulations with prespecified ground-truth connectivity (see Point 2).

**2. Known-edge simulations and baselines.**
We conducted additional controlled stress tests using an adapted implementation of the established Smith et al. BOLD simulation framework with prespecified ground-truth effective-connectivity matrices (NeuroImage, 2011). For the present experiments, we used a TR of 1 s, a 5-min scan duration, and additive two-component Gaussian-mixture noise scaled to an SNR of 10 dB. We evaluated two distinct 5-ROI directed topologies: (i) a chain-with-shortcut network (chain-SC) containing 1->2, 2->3, 3->4, 4->5, and 1->5; and (ii) a diamond DAG (diam) containing 1->2, 1->3, 2->4, 3->4, and 4->5. We additionally evaluated a 3-ROI common-driver topology containing 1->2 and 1->3, but no direct connection between nodes 2 and 3, under equal (0.4 and 0.4) and unequal (0.8 and 0.4) coupling strengths. We generated 50 independent realizations for each condition.

Gaussian capacity (GCap) was a within-framework combined ablation that retained the fitted FIR channel and edge-selection procedure but replaced empirical residual modeling and input-distribution optimization with the Gaussian-capacity calculation. GC, VAR-LiNGAM (LiNGAM), and GIMME were external baselines. All methods were evaluated on the same simulated realizations and against the same ground-truth directed-edge sets, using a consistent evaluation rule to convert method outputs into binary directed adjacency matrices where applicable. Entries below are mean $\pm$ SD.

| Net | Method | AUROC | Precision | Sensitivity | FPR |
|---|---|---|---|---|---|
| CD-e | Dual-flow | .925 ± .186 | .893 ± .223 | .900 ± .226 | .070 ± .152 |
|  | GCap | .466 ± .353 | .387 ± .420 | .350 ± .381 | .290 ± .210 |
|  | LiNGAM | .683 ± .342 | .560 ± .395 | .610 ± .408 | .260 ± .247 |
|  | GIMME | .498 ± .018 | .000 ± .000 | .000 ± .000 | .005 ± .035 |
|  | GC | .528 ± .293 | .383 ± .286 | .490 ± .357 | .410 ± .207 |
| CD-u | Dual-flow | .910 ± .168 | .873 ± .222 | .790 ± .249 | .075 ± .136 |
|  | GCap | .405 ± .310 | .287 ± .404 | .210 ± .287 | .275 ± .184 |
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

**3. Computational cost.**
We measured runtime per directed ROI pair and peak memory under sequential processing. Dual-flow used one NVIDIA L40S GPU; the CPU methods ran on the same system. Runtime is reported per directed ROI pair because total wall time depends on the number of scans and directed ROI pairs and the degree of parallelization:

| Method | Time (s)/directed ROI pair | RAM (MB) | GPU (MB) |
|---|---|---|---|
| Dual-flow | 110.4±161.3 | 2961 | 496 |
| GCap | .004±.000 | 1661 | -- |
| GC | .006±.023 | 1569 | -- |
| LiNGAM | .003±.000 | 268 | -- |
| GIMME | .364 | 423 | -- |

Dual-flow is substantially slower because it uses the empirical residual distribution and iteratively optimizes the input distribution, but its memory use remained modest at approximately 3.0 GB of host RAM and 0.5 GB of GPU memory. The variability in Dual-flow runtime reflects differences in the number of training iterations. We will add these comparisons and clarify that the Fig. 7 experiments were executed on a system equipped with four L40S GPUs, whereas the present sequential benchmark used a single L40S. Because scans and directed ROI-pair analyses are independent, they can be distributed across multiple GPUs to reduce total wall-clock time. Note: GIMME has no runtime SD because it was fitted once at the group level, yielding a single group-level estimate.

**4. Stability, sensitivity, and statistical testing.**
We agree that robustness should be characterized more clearly. As detailed in Section 3.4, FIR order—and therefore the number of fitted coefficients—is automatically selected separately for each directed ROI pair and analysis segment using an information criterion appropriate to the segment length. BIC is used for sufficiently long windows, whereas AICc is used for shorter segments with low sample-to-parameter ratios. For the tongue-motion experiment specifically, FIR order was selected separately for each directed ROI pair and trial using AICc, as described in Appendix C.3. For the sliding-window analyses, window lengths were specified a priori based on established human (Allen et al., Cerebral Cortex, 2012) and rodent (Thompson et al., NeuroImage, 2013) studies with comparable acquisition settings. Residuals were uniformly resampled with replacement from the fitted empirical residual pool.

As described in Point 2, Gaussian water-filling capacity provides a within-framework joint ablation: it retains the same fitted FIR channel and edge-selection procedure while replacing empirical residual modeling and input-distribution optimization with the conventional Gaussian-capacity calculation. We additionally evaluated sensitivity to the DualNet training sequence length $T$, defined as the number of generated time points per minibatch sequence, with $T=1024$ used by default. We tested $T\in${256, 512, 1024, 2048, 4096} using 50 random initializations for each of four residual distributions, yielding 1,000 sensitivity runs in total. Across all conditions, mean capacity estimates differed from their corresponding $T$=1024 values by at most 4.30%, and all mean shifts were no larger than the corresponding across-initialization SD at $T$=1024. All 1,000 runs completed without numerical failure and produced finite estimates. These results indicate limited sensitivity to $T$ within the tested range. The same three-pair Real-NVP architecture and EMA-based convergence criterion were fixed across all experiments rather than tuned separately for individual datasets. Capacity estimates are mean$\pm$SD across random initializations; Max. $\Delta$ is relative to T=1024.

| Distribution | T256 | T512 | T1024 | T2048 | T4096 | Max. $\Delta$ |
|---|---|---|---|---|---|---|
| Gaussian | 0.128±0.006 | 0.129±0.008 | 0.131±0.007 | 0.132±0.011 | 0.134±0.011 | 2.25% |
| Uniform | 0.236±0.011 | 0.238±0.010 | 0.237±0.012 | 0.239±0.012 | 0.238±0.011 | 1.11% |
| Student’s $t$ | 0.184±0.011 | 0.181±0.010 | 0.184±0.006 | 0.185± 0.013 | 0.190±0.017 | 3.23% |
| Exponential | 0.337±0.030 | 0.346±0.034 | 0.332±0.038 | 0.344±0.029 | 0.341±0.037 | 4.30% |

As detailed in Appendix C.3, task-versus-rest effects were assessed using right-tailed paired tests across subjects, followed by FDR correction across the tested directed ROI pairs and a predefined coefficient-of-variation criterion for between-subject variability. Subjects served as paired observations rather than separate hypotheses, and only the prespecified tongue-versus-rest contrast was evaluated; therefore, no additional correction across subjects or task conditions was required. The corresponding pFDR and CV results are already reported in Appendix D, Table 1. We will add clearer main-text cross-references to Appendices C.3 and D.
