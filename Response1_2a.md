# Response to Reviewer 3TGk's follow-up comment 1

We thank the reviewer for identifying two important limitations: validation under more complex network conditions and computational practicality at whole-brain scale. Our intended application is focused analysis of prespecified circuits; nevertheless, we substantially expanded the simulations and clarify the computational scope below.

## 1. Expanded simulation validation and reliability

Using the simulation framework and settings described in our initial rebuttal, we expanded the validation from 4 to 10 conditions to address each stress condition raised by the reviewer, as well as their combined scenarios.: equal- and unequal-coupling common drivers; diamond and hidden-driver diamond networks; chain and heterogeneous-HRF chain networks; a feedback network; a 10-ROI modular network; a 10-ROI combined stress test; and a 28-ROI macaque-derived recurrent topology. The heterogeneous-HRF conditions additionally varied regional hemodynamic parameters across realizations. Exact topologies and manipulations are reported in Appendix Table Y, with performance reported in Table X.

### Table X. Performance across simulation conditions

Values are mean±SD across 50 realizations.

| Net | Method | AUROC | Precision | Sensitivity | FPR |
|---|---|---:|---:|---:|---:|
| CD-e | Dual-flow | .888±.108 | .551±.129 | .840±.236 | .360±.169 |
|  | GCap | .700±.129 | .486±.053 | .720±.251 | .390±.161 |
|  | LiNGAM | .725±.315 | .632±.381 | .640±.379 | .210±.228 |
|  | GIMME | .498±.018 | .000±.000 | .000±.000 | .005±.035 |
|  | GC | .580±.221 | .388±.211 | .570±.335 | .420±.178 |
| CD-u | Dual-flow | .858±.104 | .557±.120 | .700±.247 | .275±.104 |
|  | GCap | .668±.130 | .503±.024 | .590±.194 | .290±.093 |
|  | LiNGAM | .713±.318 | .578±.393 | .600±.404 | .220±.206 |
|  | GIMME | .750±.000 | 1.000±.000 | .500±.000 | .000±.000 |
|  | GC | .610±.187 | .399±.207 | .560±.314 | .405±.188 |
| Diamond | Dual-flow | .874±.076 | .527±.125 | .732±.216 | .245±.122 |
|  | GCap | .777±.050 | .465±.073 | .672±.228 | .276±.129 |
|  | LiNGAM | .751±.126 | .605±.217 | .560±.236 | .131±.089 |
|  | GIMME | .505±.032 | .040±.198 | .012±.063 | .003±.013 |
|  | GC | .607±.157 | .357±.180 | .468±.204 | .307±.140 |
| Diamond (hidden) | Dual-flow | .910±.079 | .552±.136 | .807±.224 | .249±.132 |
|  | GCap | .799±.070 | .469±.070 | .793±.222 | .309±.117 |
|  | LiNGAM | .787±.172 | .627±.259 | .647±.256 | .140±.105 |
|  | GIMME | .502±.037 | .040±.198 | .013±.066 | .009±.030 |
|  | GC | .589±.233 | .378±.257 | .540±.293 | .356±.201 |
| Chain | Dual-flow | .938±.042 | .762±.163 | .744±.221 | .108±.100 |
|  | GCap | .761±.056 | .460±.070 | .556±.226 | .233±.142 |
|  | LiNGAM | .715±.160 | .598±.294 | .480±.242 | .129±.118 |
|  | GIMME | .522±.051 | .230±.419 | .052±.097 | .008±.022 |
|  | GC | .603±.100 | .357±.156 | .428±.202 | .287±.146 |
| Chain (HRF) | Dual-flow | .939±.057 | .782±.186 | .784±.217 | .105±.128 |
|  | GCap | .795±.059 | .492±.095 | .580±.222 | .216±.131 |
|  | LiNGAM | .693±.134 | .446±.195 | .448±.220 | .180±.084 |
|  | GIMME | .605±.024 | .990±.071 | .212±.048 | .001±.009 |
|  | GC | .752±.099 | .700±.280 | .392±.206 | .105±.124 |
| Feedback | Dual-flow | .889±.071 | .776±.159 | .793±.174 | .195±.157 |
|  | GCap | .613±.043 | .490±.039 | .628±.168 | .438±.130 |
|  | LiNGAM | .563±.147 | .462±.176 | .378±.170 | .288±.112 |
|  | GIMME | .333±.006 | .000±.000 | .000±.000 | .250±.000 |
|  | GC | .514±.111 | .398±.138 | .465±.205 | .458±.195 |
| Mod10 | Dual-flow | .949±.027 | .824±.146 | .604±.199 | .024±.025 |
|  | GCap | .883±.026 | .448±.070 | .509±.165 | .093±.046 |
|  | LiNGAM | .701±.098 | .428±.174 | .396±.150 | .081±.044 |
|  | GIMME | .517±.034 | .228±.384 | .040±.069 | .005±.010 |
|  | GC | .630±.098 | .227±.115 | .335±.153 | .173±.077 |
| Comp10 | Dual-flow | .879±.025 | .547±.061 | .727±.083 | .154±.040 |
|  | GCap | .852±.023 | .566±.058 | .603±.079 | .120±.036 |
|  | LiNGAM | .692±.062 | .457±.148 | .317±.108 | .103±.053 |
|  | GIMME | .566±.005 | .407±.139 | .166±.043 | .065±.019 |
|  | GC | .736±.044 | .551±.098 | .316±.121 | .070±.043 |
| Macq28 | Dual-flow | .885±.020 | .369±.098 | .650±.093 | .094±.044 |
|  | GCap | .845±.024 | .260±.058 | .614±.061 | .140±.050 |
|  | LiNGAM | — | — | — | — |
|  | GIMME | — | — | — | — |
|  | GC | — | — | — | — |

**Note on the evaluation procedure.** Our initial evaluation measured the dominant direction within each ROI pair, consistent with common pairwise directionality evaluations (Roebroeck et al., NeuroImage, 2005; Smith et al., NeuroImage, 2011). This was suitable for the original nonreciprocal topologies but does not represent reciprocal feedback, where X->Y and Y->X may both be true. We therefore extended the evaluation to treat every ordered edge independently, allowing zero, one, or both directions within each pair. For each realization, AUROC was computed from the directed EC scores across all N(N−1) candidate edges; precision, sensitivity, and FPR were computed by independently thresholding the same edge set. This full-topology evaluation was applied uniformly to every method and condition. Accordingly, differences from the initial table arise from evaluating all directed edges rather than only the dominant direction; estimator training and output scores were unchanged.

Across all conditions, Dual-flow achieved the highest AUROC in every condition. Comp10 showed only a moderate decrease relative to Mod10: Dual-flow retained an AUROC of .879 and sensitivity of .727, comparable to several diagnostic conditions and higher than all baselines. GCap was close in AUROC (.852), with slightly higher precision (.566 versus .547) and lower FPR (.120 versus .154). Thus, the coexistence of indirect paths, feedback, modular structure, hidden drivers, and heterogeneous HRFs increased difficulty but did not substantially impair Dual-flow's overall topology recovery. 

The currently completed Macq28 results are also consistent with this pattern: across 20 realizations, Dual-flow achieved AUROC=.885 and sensitivity=.650, compared with .845 and .614 for GCap. The remaining Macq28 baseline results should be added before submission.



### Appendix Table Y. Simulation topology and manipulation

| Net | ROIs (observed/total) | Directed edges | Ground-truth topology | Manipulation / condition tested | Source of network topology |
|---|---:|---:|---|---|---|
| CD-e | 3/3 | 2 | 1->2 and 1->3; weights 0.4/0.4 | Equal-coupling common driver | Xu et al. (Front. Neurosci., 2017) |
| CD-u | 3/3 | 2 | 1->2 and 1->3; weights 0.8/0.4 | Unequal-coupling common driver | Adapted from Xu et al. (Front. Neurosci., 2017) |
| Diamond | 5/5 | 5 | 1->2, 1->3, 2->4, 3->4, 4->5; weights 0.4 | Parallel indirect paths and convergence | Present study |
| Diamond (hidden) | 4/5 | 5 total; 3 evaluated | Same diamond; ROI 1 simulated but omitted | Hidden common driver of ROIs 2 and 3 | Present-study extension |
| Chain | 5/5 | 5 | 1->2->3->4->5 and 1->5; weights 0.4 | Indirect path with direct shortcut | Smith S5 (Smith et al., NeuroImage, 2011) |
| Chain (HRF) | 5/5 | 5 | Same as Chain | Regional delays −0.60–0.70 s and transit-time multipliers 0.85–1.18; realization variation* | Smith S5 with present HRF manipulation |
| Feedback | 5/5 | 6 | 1->2, 2->3, 3->4, 4->5, 3->2, 5->3; weights 0.4 | Reciprocal loop 2<->3 and cycle 3->4->5->3 | Present-study recurrent extension |
| Mod10 | 10/10 | 11 | Two S5 subnetworks connected by 3->8 | Two-module organization | Smith S10 (Smith et al., NeuroImage, 2011) |
| Comp10 | 10/12 | 22 total; 18 evaluated | **Module A:** 1->2->3->4->5, 3->2, 5->3, 1->4, 2->5<br>**Module B:** 6->7->8->9->10, 8->7, 10->8, 6->9, 7->10<br>**Cross-module:** 5->6, 9->2<br>**Hidden drivers:** 11->{2,5}, 12->{7,10}; weights 0.4 | Combined indirect paths, feedback, modular structure, two hidden drivers, and heterogeneous HRFs (regional delays −0.60–0.75 s; transit multipliers 0.85–1.20; realization variation*) | Present-study combined topology |
| Macq28 | 28/28 | 52 | Fixed weighted SmallDegree matrix; weights 0.468–0.551; 10 cycles, including five reciprocal pairs | Larger recurrent network with independently varying regional HRFs* | SmallDegree topology (Sánchez-Romero et al., 2019), derived from Markov et al. (Cereb. Cortex, 2014) |

For conditions derived from previous benchmarks, topology and connection weights were retained from the cited source unless a modification is explicitly specified.

\* Across realizations, HRF-delay SD=0.10 s and transit-time CV=5%; values were bounded to ±1.50 s and 0.65–1.40 s. HRF timing variability was motivated by Handwerker et al. (NeuroImage, 2004) and Smith et al. (NeuroImage, 2011).

- **Independent pairwise vs multivariate estimation.** We respectfully clarify that network size and pairwise confounding are distinct issues. Because Dual-flow, like other pairwise EC or FC approaches, analyzes each ROI pair independently, the estimate for a fixed pair (X->Y or Y->X) depends only on the time series of (X) and (Y). It is therefore unchanged whether these two ROIs are selected from a dataset containing 5, 50, or hundreds of ROIs. This distinguishes pairwise inference from network-level MVAR models, whose fitted parameter space grows with the number of jointly modeled ROIs. Pairwise methods also do not require assumptions about the global network architecture, such as whether the complete network is feedforward or recurrent (Bielczyk et al., Network Neuroscience, 2019).

Indirect pathways, common causes, and regional hemodynamic differences can nevertheless affect the marginal relationship between \(X\) and \(Y\). These are local identification challenges inherent to pairwise inference at any network size, rather than dimensional instability caused by increasing \(N\). Our chain, diamond, common-driver, hidden-driver, feedback, and heterogeneous-HRF conditions test these challenges separately, while the expanded 10-ROI condition tests their coexistence. Increasing \(N\) does increase the number of pairwise evaluations and the associated computational and multiple-testing burdens, which we acknowledge separately.

Complementary empirical evidence comes from Xu et al. (2021), in which the same pairwise FIR backbone, with a simpler FIR-order readout, was applied to 333 ROIs and produced spatially coherent, bilaterally organized, and network-specific estimates. This demonstrates that independently fitted FIR models can yield neuroanatomically meaningful organization in large ROI sets. It does not, by itself, establish the computational practicality or ground-truth accuracy of the present Dual-flow readout; those issues are addressed by our runtime analysis and controlled simulations, respectively.

### Reliability across realizations

The large SDs in the three-ROI common-driver conditions partly reflect metric discreteness. Each realization contains only two true and four null directed pairs; sensitivity therefore changes in increments of .50 and FPR in increments of .25.

Across 50 realizations, Dual-flow recovered 90/100 and 79/100 true edges in the equal- and unequal-coupling conditions. The corresponding realization-bootstrap 95% CIs for sensitivity were [.830, .960] and [.720, .860]. Dual-flow produced 14/200 and 15/200 false-positive selections, yielding FPRs of .070, CI [.030, .115], and .075, CI [.040, .115], respectively. Thus, the large realization-level SDs coexist with high aggregate recovery and few false-positive selections.

### Interpretation of network size and pairwise estimation

We respectfully distinguish network size from pairwise identification. The fitted model for a fixed pair \(X\)-to-\(Y\) does not become higher-dimensional when additional ROIs are present. However, indirect pathways, hidden causes, feedback, and hemodynamic differences can affect the marginal relationship between \(X\) and \(Y\) at any network size. The new diagnostic and combined conditions test these challenges directly. Increasing \(N\) additionally increases the number of pairwise evaluations, computational cost, and multiple-testing burden.

## 2. Computational cost, practical scalability, and intended use

- **Clarification of the reported runtime.** We apologize for the confusion caused by our previous runtime comparison. The reported 110.4 s per directed pair used the default \(T=1024\), but we did not state that runtime depends strongly on \(T\). As reported in our preceding response, capacity estimates showed limited sensitivity across \(T\in\{256,512,1024,2048,4096\}\), with mean differences from \(T=1024\) of at most 4.30%. We now report runtime across these settings in Table Z. The expanded simulations used \(T=512\) for networks with at most 10 observed ROIs and \(T=256\) for the 28-ROI network, substantially reducing computation and enabling the larger-network evaluation. This improves practical scalability but does not remove the \(N(N-1)\) growth in the number of directed-pair evaluations.

  **[Insert runtime-by-\(T\) table here.]**

- **Acknowledged limitation and intended practical scope.** We agree that the current Dual-flow implementation is not computationally practical for exhaustive whole-brain analysis. Even with smaller \(T\), it remains substantially slower per directed pair than GCap, GC, and LiNGAM. Exhaustive analysis requires \(N(N-1)\) evaluations, and multi-GPU parallelization reduces wall-clock time but not total computation. The added measurements quantify the limitation already stated in the original submission: “computational cost may limit scalability to larger datasets.” The present implementation is therefore intended for focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs among hundreds of ROIs.

- **Scientific value of focused EC analysis.** Limited whole-brain scalability does not preclude practical neuroimaging utility. Analysis of prespecified circuits is an established EC use case. [Smith et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3260563/) (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. [Deshpande and Hu](https://doi.org/10.1089/brain.2012.0091) (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration ([Bielczyk et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370462/), *Network Neuroscience*, 2019; [Rossini et al.](https://doi.org/10.1016/j.clinph.2019.06.006), *Clinical Neurophysiology*, 2019).

  Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified from activation maps and neuroanatomical evidence, restricting inference to 12 directed pairs. Within this intended setting, distribution-aware modeling of non-Gaussian residuals provides a distinct methodological capability, although the current implementation is not designed for unrestricted whole-brain discovery.

- **Future scalability.** We will state this intended scope more prominently and avoid implying current whole-brain computational practicality. Further computational optimization remains an important direction.

In summary, Dual-flow provides a distribution-aware EC estimator validated across diverse controlled network conditions and intended for focused, prespecified circuit analysis. The results demonstrate a clear statistical-performance–computational-efficiency trade-off; exhaustive whole-brain deployment is not yet computationally practical and remains a target for further optimization.

The expanded experiments substantially broaden the original validation but remain controlled stress tests rather than comprehensive whole-brain validation. We will constrain our claims to the network sizes and conditions evaluated.


