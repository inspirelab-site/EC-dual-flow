# Response to Reviewer 1

We appreciate the reviewer’s follow-up. We agree that the previous results did not establish reliability in more complex networks or computational practicality for unrestricted whole-brain analysis. We address and clarify these points directly below.

## 1. Expanded simulation validation and reliability

Using the simulation framework and settings described in our initial rebuttal, we expanded the validation from 4 to 10 conditions: equal- and unequal-coupling common drivers; diamond and hidden-driver diamond networks; chain and heterogeneous-HRF chain networks; a feedback network; a 10-ROI modular network; a 10-ROI combined stress test; and a 28-ROI macaque-derived recurrent topology. The heterogeneous-HRF conditions additionally varied regional hemodynamic parameters across realizations. Exact topologies and manipulations are reported in Appendix Table Y.

### Table X. Performance across simulation conditions

Values are mean±SD across 50 realizations.

| Net | Method | AUROC | Precision | Sensitivity | FPR |
|---|---|---:|---:|---:|---:|
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
| Diamond | Dual-flow | .888±.101 | .653±.135 | .836±.170 | .156±.077 |
|  | GCap | .553±.180 | .379±.211 | .412±.215 | .241±.111 |
|  | LiNGAM | .717±.140 | .499±.149 | .640±.185 | .227±.096 |
|  | GIMME | .505±.032 | .040±.198 | .012±.063 | .003±.013 |
|  | GC | .564±.199 | .304±.164 | .484±.259 | .376±.108 |
| Diamond (hidden) | Dual-flow | .911±.133 | .865±.185 | .767±.226 | .056±.079 |
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
|  | GCap | .652±.155 | .652±.277 | .400±.206 | .091±.091 |
|  | LiNGAM | .606±.151 | .431±.222 | .360±.214 | .148±.069 |
|  | GIMME | .606±.024 | 1.000±.000 | .212±.048 | .000±.000 |
|  | GC | .723±.117 | .707±.278 | .380±.199 | .095±.111 |
| Feedback | Dual-flow | **TBD** | **TBD** | **TBD** | **TBD** |
|  | GCap | **TBD** | **TBD** | **TBD** | **TBD** |
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
| Macq28 | Dual-flow | **TBD** | **TBD** | **TBD** | **TBD** |
|  | GCap | **TBD** | **TBD** | **TBD** | **TBD** |
|  | LiNGAM | **TBD** | **TBD** | **TBD** | **TBD** |
|  | GIMME | **TBD** | **TBD** | **TBD** | **TBD** |
|  | GC | **TBD** | **TBD** | **TBD** | **TBD** |

Across all 10 conditions, Dual-flow achieved the highest AUROC. Performance remained strong with a hidden common driver (AUROC=.911), heterogeneous HRFs (.964), and modular organization (.929).

Performance decreased when the challenges coexisted in Comp10, confirming that this was a substantially harder identification problem. Nevertheless, Dual-flow retained the highest AUROC (.724 versus .636 for the next-best method), precision (.648 versus .542), and sensitivity (.517 versus .309). Its FPR (.071) was comparable to GC (.070) and GCap (.073). GIMME achieved a slightly lower FPR (.062) but substantially lower sensitivity (.154), reflecting a more conservative operating point rather than stronger overall recovery.

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

The expanded experiments substantially broaden the original validation but remain controlled stress tests rather than comprehensive whole-brain validation. We will constrain our claims to the network sizes and conditions evaluated.


