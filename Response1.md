We thank the reviewer and address the four concerns and related questions below.

**1. Real-data evaluation and neuroscience support.**
The tongue-motion experiment was not an unconstrained whole-brain exploratory analysis. As described in Appendix C.1, the four tongue ROIs in Fig. 2B were defined from data-specific task-activation maps generated with FSL FEAT and localized to cerebellar and bilateral orofacial sensorimotor regions reported for the HCP motor task (Barch et al., 2013). We focused on this network because its signals, particularly those from left BA3b.OP4, showed pronounced non-Gaussianity, making it a task-relevant stress test of EC estimators with versus without Gaussian assumptions. EC analysis was therefore restricted to the 12 within-network directed ROI pairs.

As detailed in Section 4.3, the identified interactions were consistent with established contralateral cerebello-cortical circuitry (Manto et al., Cerebellum, 2012; Sasegbon et al., Dysphagia, 2023) and bilateral orofacial sensorimotor organization (Rizzolatti et al., Neuron, 2001; Todorov et al., Nature Neuroscience, 2004). We will make this existing connection-specific anatomical and functional support more systematic and visible in the revision. Although the task-evoked circuit is well established, human fMRI does not provide ground-truth labels for its exact directed edges. The real-data analysis therefore evaluates whether the estimated interactions are task-sensitive and consistent with established tongue-motion circuitry rather than providing definitive ground-truth validation. We now provide quantitative validation of directed-edge recovery using new simulations with prespecified ground-truth connectivity (see Point 2).

**2. Known-edge simulations and broader baselines.**
We conducted controlled stress tests using the established Smith et al. BOLD simulation framework with prespecified ground-truth directed EC matrices (Smith et al., NeuroImage, 2011). We configured the framework with TR = 1 s, 5-min scans, and two-component Gaussian-mixture noise at 10 dB SNR. We tested four conditions: a 5-ROI chain with shortcut (1->2->3->4->5; 1->5), a 5-ROI diamond DAG (1->2, 1->3, 2->4, 3->4, 4->5), and a 3-ROI common-driver network (1->2, 1->3; no 2<->3) with equal (.4/.4) or unequal (.8/.4) coupling, using 50 realizations each.

We selected representative EC baselines spanning complementary frameworks with continued use in neuroimaging that can be applied to the same ROI time series and evaluated against the same directed ground truth without auxiliary experimental inputs or anatomical priors. Granger Causality (GC) measures linear directed predictability and remains used in multisite and repeat-scan fMRI studies (Zhu et al., 2023; Mellema and Montillo, 2023). VAR-LiNGAM provides non-Gaussian structural identification; LiNGAM-family methods demonstrated effective directionality recovery on Smith simulations (Hyvärinen and Smith, 2013), and VAR-LiNGAM was included in a recent whole-brain fMRI causal-discovery benchmark (Arab et al., 2025). GIMME performs group- and individual-level SEM search; it was validated on Smith-derived networks (Gates and Molenaar, 2012; Sanchez-Romero et al., 2019) and remains used in recent clinical fMRI studies (Murray et al., 2024). Unlike GC, VAR-LiNGAM, and GIMME, which estimate directed predictability or network structure, our framework fits a directional FIR model for each ordered ROI pair and uses the capacity of the resulting FIR-residual channel as the EC metric. Intuitively, this capacity quantifies how much information the fitted X->Y dynamics can transmit despite empirical residual variability. Dual-flow estimates it without assuming Gaussian residuals while optimizing the admissible input distribution. GCap served as the within-framework ablation, retaining the same FIR channel and edge-selection rule but using Gaussian capacity.

All methods used the same realizations, directed ground truth, and binarization rule where applicable; entries are mean±SD.

| Net | Method | AUROC | Precision | Sensitivity | FPR |
|---|---|---|---|---|---|
| CD-e | Dual-flow | .925±.186 | .893±.223 | .900±.226 | .070±.152 |
|  | GCap | .466±.353 | .387±.420 | .350±.381 | .290±.210 |
|  | LiNGAM | .683±.342 | .560±.395 | .610±.408 | .260±.247 |
|  | GIMME | .498±.018 | .000±.000 | .000±.000 | .005±.035 |
|  | GC | .528±.293 | .383±.286 | .490±.357 | .410±.207 |
| CD-u | Dual-flow | .910±.168 | .873±.222 | .790±.249 | .075±.136 |
|  | GCap | .405±.310 | .287±.404 | .210±.287 | .275±.184 |
|  | LiNGAM | .690±.352 | .590±.390 | .630±.414 | .235±.223 |
|  | GIMME | .750±.000 | 1.000±.000 | .500±.000 | .000±.000 |
|  | GC | .485±.297 | .327±.301 | .390±.354 | .400±.202 |
| Chain | Dual-flow | .895±.109 | .691±.155 | .828±.167 | .136±.082 |
|  | GCap | .492±.144 | .310±.180 | .320±.198 | .224±.084 |
|  | LiNGAM | .684±.195 | .460±.201 | .580±.219 | .248±.120 |
|  | GIMME | .522±.051 | .230±.419 | .052±.097 | .008±.022 |
|  | GC | .506±.118 | .251±.093 | .380±.158 | .379±.094 |
| Chain (HRF) | Dual-flow | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | GCap | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | LiNGAM | .606±.151 | .431±.222 | .360±.214 | .148±.069 |
|  | GIMME | .606±.024 | 1.000±.000 | .212±.048 | .000±.000 |
|  | GC | .723±.117 | .707±.278 | .380±.199 | .095±.111 |
| Diam. | Dual-flow | .888±.101 | .653±.135 | .836±.170 | .156±.077 |
|  | GCap | .553±.180 | .379±.211 | .412±.215 | .241±.111 |
|  | LiNGAM | .717±.140 | .499±.149 | .640±.185 | .227±.096 |
|  | GIMME | .505±.032 | .040±.198 | .012±.063 | .003±.013 |
|  | GC | .564±.199 | .304±.164 | .484±.259 | .376±.108 |
| Diam(H) | Dual-flow | .911±.133 | .865±.185 | .767±.226 | .056±.079 |
|  | GCap | .545±.241 | .415±.320 | .367±.263 | .173±.106 |
|  | LiNGAM | .755±.171 | .555±.197 | .733±.202 | .218±.119 |
|  | GIMME | .502±.037 | .040±.198 | .013±.066 | .009±.030 |
|  | GC | .558±.250 | .300±.197 | .507±.318 | .402±.134 |
| Feedback | Dual-flow | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | GCap | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | LiNGAM | .566±.141 | .467±.181 | .370±.169 | .275±.103 |
|  | GIMME | .333±.006 | .000±.000 | .000±.000 | .250±.000 |
|  | GC | .478±.126 | .363±.163 | .333±.157 | .377±.149 |
| Modular | Dual-flow | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | GCap | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
|  | LiNGAM | .639±.121 | .434±.173 | .387±.150 | .076±.039 |
|  | GIMME | .517±.034 | .228±.384 | .040±.069 | .005±.010 |
|  | GC | .535±.103 | .220±.126 | .275±.129 | .155±.069 |
| Comb. | Dual-flow | .724±.064 | .442±.103 | .648±.078 | .216±.068 |
|  | GCap | .591±.066 | .380±.088 | .408±.079 | .172±.049 |
|  | LiNGAM | .561±.067 | .284±.067 | .412±.086 | .269±.063 |
|  | GIMME | .559±.017 | .354±.057 | .194±.034 | .088±.008 |
|  | GC | .636±.035 | .398±.080 | .484±.084 | .196±.071 |

Dual-flow achieved the highest mean AUROC and sensitivity in all four conditions and the highest precision in three of four conditions. It consistently outperformed GCap, supporting the joint contribution of empirical residual modeling and input-distribution optimization. GIMME generally achieved low FPR at the cost of very low sensitivity.

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
We agree that robustness should be clearer. For each directed ROI pair and analysis segment, the FIR model order was automatically determined using BIC for long windows and AICc for short windows (see Section 3.4). In tongue fMRI, AICc-determined $N_h$ varied across pairs and subjects ($1.61\pm1.52$ samples; range 1–10), confirming data-adaptive rather than fixed model complexity (see implementation details in Appendix C.3). Sliding-window lengths were fixed a priori based on established human (Allen et al., Cerebral Cortex, 2012) and rodent (Thompson et al., NeuroImage, 2013) studies with comparable acquisition settings. Residuals were uniformly resampled with replacement from the fitted empirical residual pool.

We evaluated sensitivity to the Dual-flow training sequence length $T$ (generated time points per minibatch sequence), with $T$=1024 by default. We tested $T\in${256, 512, 1024, 2048, 4096} using 50 random initializations for each of four residual distributions, yielding 1,000 sensitivity runs in total. Across all conditions, mean capacity estimates differed from their corresponding $T$=1024 values by at most 4.30%, and all mean shifts were no larger than the corresponding across-initialization SD at $T$=1024. All 1,000 runs completed without numerical failure and produced finite estimates. These results indicate limited sensitivity to $T$ within the tested range. The same three-coupling-pair Real-NVP architecture and EMA-based convergence criterion were fixed across all experiments rather than tuned to individual datasets; a broader architecture-depth ablation was not performed and will be acknowledged as a limitation.

Capacity estimates are mean±SD across random initializations; Max. $\Delta$ is relative to T=1024.

| Distribution | T256 | T512 | T1024 | T2048 | T4096 | Max. $\Delta$ |
|---|---|---|---|---|---|---|
| Gaussian | .128±.006 | .129±.008 | .131±.007 | .132±.011 | .134±.011 | 2.25% |
| Uniform | .236±.011 | .238±.010 | .237±.012 | .239±.012 | .238±.011 | 1.11% |
| Student’s $t$ | .184±.011 | .181±.010 | .184±.006 | .185±.013 | .190±.017 | 3.23% |
| Exponential | .337±.030 | .346±.034 | .332±.038 | .344±.029 | .341±.037 | 4.30% |

As detailed in Appendix C.3, task-versus-rest effects were assessed using right-tailed paired tests across subjects, followed by FDR correction across the tested directed ROI pairs and a predefined coefficient-of-variation criterion for between-subject variability. Subjects served as paired observations rather than separate hypotheses, and only the prespecified tongue-versus-rest contrast was evaluated; therefore, no additional correction across subjects or task conditions was required. The corresponding pFDR and CV results are already reported in Appendix D, Table 1. We will add clearer main-text cross-references to Appendices C.3 and D.
