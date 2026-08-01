# Response to Reviewer 3TGk's follow-up comment 1

We thank the reviewer for identifying two important limitations: validation under more complex network conditions and computational practicality at whole-brain scale. Our intended application is focused analysis of prespecified circuits; nevertheless, we substantially expanded the simulations and clarify the computational scope below.

## 1. Expanded simulation validation and reliability

- **Expanded network topologies and confounding covariates.** Using the simulation framework and settings described in our initial rebuttal, we expanded the validation from four to ten conditions to address the challenges identified by the reviewer individually and jointly: equal- and unequal-coupling common drivers; diamond and hidden-driver diamond networks; chain and heterogeneous-HRF chain networks; a feedback network; a 10-ROI modular network; a 10-ROI combined stress test; and a 28-ROI macaque-derived recurrent topology.

  The chain and diamond conditions test indirect pathways; common-driver and hidden-diamond conditions test omitted causes; Feedback tests reciprocal and recurrent connections; Mod10 tests modular structure; Chain-HRF tests regional hemodynamic heterogeneity; Comp10 tests their coexistence; and Macq28 tests a larger recurrent topology.

  We generated 50 independent realizations per condition under matched acquisition and noise settings rather than reuse fixed released time series, enabling reliability assessment while systematically varying topology, hidden drivers, regional HRFs, and their coexistence. In the heterogeneous-HRF conditions, hemodynamic parameters varied both regionally and across realizations. All methods were evaluated on identical data and ground truth. Exact topologies and manipulations are reported in Appendix Table Y, with performance reported in Table X.

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
  |  | GCap | .668±.130 | .503±.024 | .590±.194 | .290±.093
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
  | Mac.-28 | Dual-flow | .885±.018 | .389±.102 | .634±.098 | .086±.043 |
  |  | GCap | .845±.022 | .260±.055 | .612±.057 | .139±.047 |
  |  | LiNGAM | .578±.038 | .124±.038 | .165±.068 | .088±.029 |
  |  | GIMME | — | — | — | — |
  |  | GC | .679±.029 | .174±.086 | .102±.070 | .035±.024 |
  
  **Note on the evaluation procedure.** Our initial evaluation measured the dominant direction within each ROI pair, consistent with common pairwise directionality evaluations (Roebroeck et al., *NeuroImage*, 2005; Smith et al., *NeuroImage*, 2011). This was appropriate for the original nonreciprocal topologies but cannot represent reciprocal feedback, where X->Y and Y->X may both be true. We therefore evaluated every ordered edge independently, allowing zero, one, or both directions within each pair. For each realization, AUROC was computed from the directed EC scores across all N(N−1) candidate edges; precision, sensitivity, and FPR were computed after independently thresholding each normalized directed score at the prespecified threshold of 0.4. This full-topology evaluation was applied uniformly to every method and condition. Differences from the initial table therefore reflect the expanded evaluation target—from dominant-direction recovery to complete directed-edge recovery—while the underlying estimator outputs remained unchanged.

  Across all conditions, Dual-flow achieved the highest AUROC in every condition. Comp10 showed only a moderate decrease relative to Mod10: Dual-flow retained an AUROC of .879 and sensitivity of .727, comparable to several diagnostic conditions and higher than all baselines. GCap was close in AUROC (.852), with slightly higher precision (.566 versus .547) and lower FPR (.120 versus .154). Thus, the coexistence of indirect paths, feedback, modular structure, hidden drivers, and heterogeneous HRFs increased difficulty but did not substantially impair Dual-flow's overall topology recovery. 

  The currently completed Macq28 results are also consistent with this pattern: across 20 realizations, Dual-flow achieved AUROC=.885 and sensitivity=.650, compared with .845 and .614 for GCap. The remaining Macq28 baseline results should be added before submission.

- **Reliability across realizations.** Across 50 realizations, threshold-independent recovery remained strong, with AUROCs of .888±.108 and .858±.104 in CD-e and CD-u. Threshold-dependent metrics are necessarily coarse because each realization contains only two true and four null directed edges; sensitivity therefore changes in increments of .50 and FPR in increments of .25. In a threshold-sensitivity analysis, increasing the threshold from 0.4 to 0.6 reduced FPR from .360 to .185 and from .275 to .170, with corresponding sensitivity reductions from .840 to .690 and from .700 to .600, while AUROC remained unchanged. Thus, the larger variability in sensitivity and FPR reflects coarse metric resolution and threshold-dependent edge selection, whereas the underlying edge-ranking performance was comparatively consistent. Overall, the common-driver conditions remained challenging across EC methods, but Dual-flow achieved the highest AUROC in both conditions.

- **Independent pairwise vs network sizes.** We respectfully clarify that network size and pairwise confounding are distinct issues. For a pairwise EC method such as Dual-flow, each ordered pair is estimated independently; therefore, an X->Y estimate depends only on the time series of X and Y. Unlike jointly fitted multivariate models, adding other ROI time series does not refit or alter existing pairwise estimates, supporting focused, prespecified circuit analysis. This invariance does not make pairwise inference immune to confounding: outside nodes can influence X and Y through common causes or indirect paths, while feedback and regional hemodynamic differences can further complicate identification. These are local identification challenges at any network size, rather than growth in the per-pair model dimension. Our diagnostic conditions test these effects separately, and Comp10 tests their coexistence.


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
