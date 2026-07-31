# Response to Reviewer 1

We appreciate the additional comments. We agree that the current evidence does not establish unrestricted whole-brain scalability, which was not the intended scope of the present study. We address the reviewer's additional concerns below:

## 1. Reliability and validity of the known-edge simulations

- **Additional simulation topologies.** We appreciate the reviewer’s identification of challenges that can arise in more complex brain networks. We expanded the validation using matched diagnostic conditions that isolate specific challenge, we also tested a combined condition that test their coexistence, as well as a mac1-28 motived synethetic adjacenty matrix. The table below summarizes the primary condition tested by each topology and the performance of each method.

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
  | Diam | Dual-flow | .888±.101 | .653±.135 | .836±.170 | .156±.077 |
  |  | GCap | .553±.180 | .379±.211 | .412±.215 | .241±.111 |
  |  | LiNGAM | .717±.140 | .499±.149 | .640±.185 | .227±.096 |
  |  | GIMME | .505±.032 | .040±.198 | .012±.063 | .003±.013 |
  |  | GC | .564±.199 | .304±.164 | .484±.259 | .376±.108 |
  | Diam(H) | Dual-flow | .911±.133 | .865±.185 | .767±.226 | .056±.079 |
  |  | GCap | .545±.241 | .415±.320 | .367±.263 | .173±.106 |
  |  | LiNGAM | .755±.171 | .555±.197 | .733±.202 | .218±.119 |
  |  | GIMME | .502±.037 | .040±.198 | .013±.066 | .009±.030 |
  |  | GC | .558±.250 | .300±.197 | .507±.318 | .402±.134 |  
  | Chain | Dual-flow | .948±.068 | .943±.116 | .724±.221 | .020±.043 |
  |  | GCap | .430±.160 | .248±.286 | .164±.179 | .163±.099 |
  |  | LiNGAM | .684±.195 | .460±.201 | .580±.219 | .248±.120 |
  |  | GIMME | .522±.051 | .230±.419 | .052±.097 | .008±.022 |
  |  | GC | .506±.118 | .251±.093 | .380±.158 | .379±.094 |
  | Chain (HRF) | Dual-flow | .964±.070 | .943±.134 | .772±.225 | .024±.061 |
  |  | GCap | .652±.155 | .652±.277 | .400±.206 | .091±.091 
  |  | LiNGAM | .606±.151 | .431±.222 | .360±.214 | .148±.069 |
  |  | GIMME | .606±.024 | 1.000±.000 | .212±.048 | .000±.000 |
  |  | GC | .723±.117 | .707±.278 | .380±.199 | .095±.111 |
  | Feed | Dual-flow | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | GCap | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | LiNGAM | .566±.141 | .467±.181 | .370±.169 | .275±.103 |
  |  | GIMME | .333±.006 | .000±.000 | .000±.000 | .250±.000 |
  |  | GC | .478±.126 | .363±.163 | .333±.157 | .377±.149 |
  | Mod10 | Dual-flow | .929±.064 | .955±.079 | .600±.198 | .005±.011 |
  |  | GCap | .528±.108 | .328±.166 | .207±.129 | .059±.028 |
  |  | LiNGAM | .639±.121 | .434±.173 | .387±.150 | .076±.039 |
  |  | GIMME | .517±.034 | .228±.384 | .040±.069 | .005±.010 |
  |  | GC | .535±.103 | .220±.126 | .275±.129 | .155±.069 |
  | Comp10 | Dual-flow | .724±.064 | .648±.111 | .517±.100 | .071±.025 |
  |  | GCap | .591±.066 | .525±.111 | .309±.058 | .073±.026 |
  |  | LiNGAM | .561±.067 | .430±.152 | .252±.093 | .091±.044 |
  |  | GIMME | .559±.017 | .405±.148 | .154±.042 | .062±.019 |
  |  | GC | .636±.035 | .542±.101 | .301±.112 | .070±.042 |
  | Macq28 | Dual-flow | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | GCap | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | LiNGAM | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | GIMME | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |
  |  | GC | xx±.xx | .xx±.xx | .xx±.xx | .xx±.xx |


**Table X. Simulation topology, targeted challenge, and source.** Candidate pairs include all possible directed connections among observed ROIs, excluding self-connections. “Observed edges” are the directed edges treated as positives during evaluation. References identify the source of the topology; all modified conditions use our adapted simulation settings.

| Condition | Observed/total ROIs | Candidate pairs | Ground-truth topology or manipulation | Observed edges | Primary feature evaluated | Topology source/resource |
|---|---:|---:|---|---:|---|---|
| CD-e | 3/3 | 6 | 1->2, 1->3; coupling strengths 0.4/0.4 | 2 | Divergent common-driver motif with equal coupling | Present-study diagnostic condition; standard common-cause/fork motif |
| CD-u | 3/3 | 6 | 1->2, 1->3; coupling strengths 0.8/0.4 | 2 | Divergence and unequal coupling | Present-study diagnostic condition |
| Diamond | 5/5 | 20 | 1->2, 1->3, 2->4, 3->4, 4->5 | 5 | Parallel indirect pathways and convergent inputs | Present-study diagnostic diamond DAG |
| Diamond (hidden) | 4/5 | 12 | Full diamond simulated, but ROI 1 omitted; evaluated edges are 2->4, 3->4, and 4->5 | 3 | Latent common cause of ROIs 2 and 3 | Present-study hidden-node extension of the diamond condition |
| Chain | 5/5 | 20 | 1->2->3->4->5, with shortcut 1->5 | 5 | Canonical indirect pathway with a direct shortcut | Smith S5 topology: [Smith et al. (2011)](https://pubmed.ncbi.nlm.nih.gov/20817103/); [NetSim data and code](https://www.fmrib.ox.ac.uk/datasets/netsim/) |
| Chain (HRF) | 5/5 | 20 | Same S5 topology with randomly varying regional HRF parameters | 5 | Hemodynamic heterogeneity while holding topology fixed | Smith S5 and HRF-variability framework, with the present study’s adapted HRF implementation |
| Feedback | 5/5 | 20 | 1->2->3->4->5, plus 3->2 and 5->3 | 6 | Reciprocal feedback and a longer recurrent cycle | Present-study recurrent extension; motivated by the cyclic simulations of [Smith et al. (2011)](https://pubmed.ncbi.nlm.nih.gov/20817103/) and [Sánchez-Romero et al. (2019)](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370458/) |
| Modular-10 | 10/10 | 90 | Two S5 subnetworks connected by one directed cross-subnetwork edge | 11 | Two-subnetwork organization and sparse between-subnetwork connectivity | Smith S10 topology: [Smith et al. (2011)](https://pubmed.ncbi.nlm.nih.gov/20817103/); [NetSim resource](https://www.fmrib.ox.ac.uk/datasets/netsim/) |
| Combined-10 | 10/12 | 90 | Two recurrent five-node modules, sparse cross-module connections, multiple direct and indirect paths, and two omitted drivers | 18 observed; 22 total | Coexistence of feedback, modular organization, indirect paths, latent drivers, and heterogeneous HRFs | Present-study combined stress test constructed from the preceding diagnostic conditions |
| Macaque-28 | 28/28 | 756 | Macaque SmallDegree matrix containing 52 directed edges, 10 cycles, and five reciprocal two-cycles; simulated with random regional HRF variation | 52 | Larger network size, recurrent connectivity, anatomical topology, and heterogeneous HRFs | SmallDegree topology from [Sánchez-Romero et al. (2019)](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370458/), derived from the tracer-based macaque connectome of [Markov et al. (2014)](https://pmc.ncbi.nlm.nih.gov/articles/PMC3862262/); [Feedback-Discovery resource](https://github.com/cabal-cmu/Feedback-Discovery) |

All conditions were generated using the same linear neural-dynamics and Balloon–Windkessel framework, with condition-specific topology and hemodynamic manipulations. The present simulations additionally used Markov-switching Gaussian-mixture neural inputs and temporally correlated non-Gaussian BOLD measurement noise. Thus, the Smith and macaque labels identify the source of the ground-truth topology rather than an exact reproduction of every original simulation parameter.



- The chain and diamond networks test direct versus indirect pathways and convergent or divergent organization. The chain-HRF condition adds regional and subject-level hemodynamic variability while retaining the same neural topology. The Diamond-hidden condition removes the common source node from the analyzed data. The feedback condition introduces recurrent connectivity, and the modular 10-ROI condition provides a size-matched control without hidden drivers or heterogeneous hemodynamics. Finally, the combined condition jointly incorporates modular organization, indirect and recurrent pathways, multiple omitted common drivers, and heterogeneous regional and subject-level hemodynamics. All conditions contain 50 independent realizations.

  Performance decreased in the more demanding combined condition, confirming that simultaneous network complexities present a substantially harder identification problem. Nevertheless, Dual-flow retained the highest mean AUROC (.724), precision (.648), and sensitivity (.517) among the evaluated methods, with an FPR of .071. GIMME achieved the lowest FPR (.062) but substantially lower sensitivity (.154), indicating a conservative operating point rather than stronger overall edge recovery. These results extend the controlled validation beyond the original 3–5-ROI DAGs while also showing that performance is reduced under joint complexity. We therefore do not present the combined experiment as comprehensive whole-brain validation.


  The chain with the \(1\to5\) shortcut is the canonical S5 topology introduced by [Smith et al. (2011)](https://www.contrib.andrew.cmu.edu/org/fmri-research/Smith-FMRI-2011.pdf) and subsequently widely used as a controlled EC benchmark. We retained this topology and added diamond and common-driver networks to evaluate complementary feedforward structures, including indirect paths, convergent and divergent motifs, unequal coupling, and an omitted common driver.

  These experiments do not test feedback loops, explicit modular organization, multiple simultaneous confounders, heterogeneous regional hemodynamics, or their combined effects in a large network. The limited biological realism of small controlled networks is a general limitation of simulation-based EC validation, not a method-specific limitation of Dual-flow. All methods were evaluated on identical realizations and directed ground truth, so their comparative results remain valid within the tested conditions. The simplified topologies limit generalization, but they do not demonstrate that Dual-flow is uniquely more vulnerable than the baseline methods.


- **Reliability across realizations.** Each three-ROI common-driver network contains only two true and four null directed pairs. Consequently, realization-level sensitivity changes in increments of .50, FPR in increments of .25, and AUROC is also coarse because it is based on only eight positive–negative edge comparisons. The large realization-level SDs therefore partly reflect metric discreteness. Across 50 realizations, Dual-flow recovered 90/100 and 79/100 true edges in the equal- and unequal-coupling conditions, respectively. Mean sensitivities were .900 (approximate 95% realization-bootstrap CI [.830, .960]) and .790 ([.720, .860]). Dual-flow produced 14/200 and 15/200 false-positive selections, corresponding to FPRs of .070 ([.030, .115]) and .075 ([.040, .115]). These aggregate results demonstrate high recovery and few false-positive selections under the tested common-driver conditions.

- **Relation to broader simulation benchmarks.** The broader Smith suite includes larger modular networks, backward and cyclic connections, shared inputs, and heterogeneous HRFs across separate simulation conditions. We did not directly reuse the released datasets because they were generated under the original acquisition and additive-noise settings, whereas our validation specifically examined TR=1 s, 5-min scans, and non-Gaussian two-component Gaussian-mixture noise at 10 dB SNR. These settings are central to evaluating a distribution-aware estimator.

  Extending the adapted generator and Dual-flow evaluation to the full Smith suite would be valuable but is beyond the present study. More generally, existing simulation benchmarks address selected subsets of realistic network and hemodynamic complications rather than every factor jointly. Developing a comprehensive brain-network simulator is an important but separate undertaking and is not the methodological focus of this work.

  
- **Generalization of Simulation Results.** We agree that large-scale biological realism remains a limitation of the present validation and of simulation-based EC evaluation more broadly. Our topology selection followed a controlled diagnostic design. The five-node chain with shortcut is the established S5 benchmark introduced by Smith et al., while the diamond and common-driver conditions systematically test parallel indirect pathways, convergent and divergent connections, equal versus unequal coupling, and a common input omitted from a pairwise model. Fifty independent realizations per condition provide known-ground-truth evaluation across these complementary challenges. These experiments provide controlled validation of the proposed estimator’s core claims, but do not establish performance for all possible combinations of large-scale modular organization, recurrent dynamics, latent causes, and heterogeneous hemodynamics. Constructing and validating a biologically comprehensive whole-brain simulator would constitute a separate methodological contribution. We will clarify this boundary and avoid extending our claims beyond the network scales and conditions evaluated here.

- **Independent pairwise vs multivariate estimation.** We respectfully clarify that network size and pairwise confounding are distinct issues. Because Dual-flow, like other pairwise EC or FC approaches, analyzes each ROI pair independently, the estimate for a fixed pair (X->Y or Y->X) depends only on the time series of (X) and (Y). It is therefore unchanged whether these two ROIs are selected from a dataset containing 5, 50, or hundreds of ROIs. This distinguishes pairwise inference from network-level MVAR models, whose fitted parameter space grows with the number of jointly modeled ROIs. Pairwise methods also do not require assumptions about the global network architecture, such as whether the complete network is feedforward or recurrent (Bielczyk et al., Network Neuroscience, 2019).

Indirect pathways, common causes, and regional hemodynamic differences can nevertheless affect the marginal relationship between \(X\) and \(Y\). These are local identification challenges inherent to pairwise inference at any network size, rather than dimensional instability caused by increasing \(N\). Our chain, diamond, common-driver, hidden-driver, feedback, and heterogeneous-HRF conditions test these challenges separately, while the expanded 10-ROI condition tests their coexistence. Increasing \(N\) does increase the number of pairwise evaluations and the associated computational and multiple-testing burdens, which we acknowledge separately.

Complementary empirical evidence comes from Xu et al. (2021), in which the same pairwise FIR backbone, with a simpler FIR-order readout, was applied to 333 ROIs and produced spatially coherent, bilaterally organized, and network-specific estimates. This demonstrates that independently fitted FIR models can yield neuroanatomically meaningful organization in large ROI sets. It does not, by itself, establish the computational practicality or ground-truth accuracy of the present Dual-flow readout; those issues are addressed by our runtime analysis and controlled simulations, respectively.

## 2. Computational cost, practical scalability, and intended use

- **Acknowledged limitation and intended practical scope.** We agree that the current Dual-flow implementation is not computationally practical for exhaustive whole-brain analysis. It is roughly four orders of magnitude slower per directed pair than the millisecond-scale GCap, GC, and LiNGAM baselines. Exhaustive analysis requires \(N(N-1)\) evaluations, and multi-GPU parallelization reduces wall-clock time but not total computation. This is consistent with the limitation stated in the original submission that “computational cost may limit scalability to larger datasets.” The added runtime and memory measurements quantify this limitation. Accordingly, the present implementation is intended for focused, prespecified circuit analysis rather than exhaustive evaluation of all directed pairs among hundreds of ROIs.

- **Scientific value of focused EC analysis.** Lack of exhaustive whole-brain scalability does not preclude utility for focused neuroimaging analysis. Focused analysis of prespecified circuits is an established use case across EC frameworks. [Smith et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC3260563/) (*Frontiers in Systems Neuroscience*, 2012) note that effective connections are often estimated among a small number of task-relevant ROIs. [Deshpande and Hu](https://doi.org/10.1089/brain.2012.0091) (*Brain Connectivity*, 2012) distinguish confirmatory circuit analysis from exploratory network discovery as approaches serving different scientific objectives. Methodological reviews similarly distinguish hypothesis-driven analysis of predefined subnetworks from unrestricted whole-brain exploration ([Bielczyk et al.](https://pmc.ncbi.nlm.nih.gov/articles/PMC6370462/), *Network Neuroscience*, 2019; [Rossini et al.](https://doi.org/10.1016/j.clinph.2019.06.006), *Clinical Neurophysiology*, 2019).

  Our empirical experiment follows this hypothesis-driven design: four task-relevant tongue-motion ROIs were prespecified from activation maps and neuroanatomical evidence, restricting inference to 12 directed pairs. Within this setting, distribution-aware modeling of non-Gaussian residuals provides a distinct methodological capability, even though the current implementation is not designed for unrestricted whole-brain discovery.

- **Future scalability.** We will state this intended scope more prominently and avoid implying current whole-brain computational practicality. Further computational optimization remains an important direction for extending the method to larger networks.

In summary, the results indicate a statistical-performance–computational-efficiency trade-off: Dual-flow improves directed-edge recovery under the tested conditions but at substantially greater computational cost. The present contribution should therefore be evaluated as a proof-of-concept estimator for focused circuit analysis, not as a ready-to-use framework for exhaustive whole-brain discovery.
