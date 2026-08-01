We thank the reviewer and address Point 1: We expanded validation to 10 conditions: CD-e/u, Diamond/hidden, Chain/HRF, Feedback, Mod10, Comp10, and a 28-ROI macaque-derived recurrent topology with 756 candidate directed pairs (see Table Y). These conditions test indirect paths, common and omitted causes, recurrence, modularity, heterogeneous HRFs, their coexistence, and network scale. Each condition included 50 realizations.

Table X. 

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
| Diam | Dual-flow | .874±.076 | .527±.125 | .732±.216 | .245±.122 |
|  | GCap | .777±.050 | .465±.073 | .672±.228 | .276±.129 |
|  | LiNGAM | .751±.126 | .605±.217 | .560±.236 | .131±.089 |
|  | GIMME | .505±.032 | .040±.198 | .012±.063 | .003±.013 |
|  | GC | .607±.157 | .357±.180 | .468±.204 | .307±.140 |
| Diam (H) | Dual-flow | .910±.079 | .552±.136 | .807±.224 | .249±.132 |
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
| Feed. | Dual-flow | .889±.071 | .776±.159 | .793±.174 | .195±.157 |
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
| Macq28 | Dual-flow | .886±.018 | .396±.102 | .632±.093 | .083±.045 |
|  | GCap | .847±.023 | .263±.054 | .611±.055 | .136±.047 |
|  | LiNGAM | .578±.038 | .124±.038 | .165±.068 | .088±.029 |
|  | GC | .679±.029 | .174±.086 | .102±.070 | .035±.024 |

Values are mean±SD; threshold=.4 (see Point 1-appendix).

**Performance.** Dual-flow achieved the highest AUROC across all ten conditions (.858–.949), including Comp10 (.879) and Macq28 (.884). Across 50 CD-e/u realizations each, AUROCs were .888±.108/.858±.104. Each realization has only two true and four null edges, so sensitivity/FPR change in .50/.25 increments. Raising the threshold from .4 to .6 reduced FPR from .360/.275 to .185/.170 and sensitivity from .840/.700 to .690/.600; AUROC was unchanged. Thus, discreteness and threshold choice partly explain the SDs, while edge ranking remained strong. > Overall, Dual-flow maintained strong, competitive performance across individual stressors, their coexistence, and the larger network.

**Pairwise estimation and network scale.** We agree that pairwise fits do not model the full network jointly. As network complexity increases, X and Y may be influenced by additional common drivers, indirect paths, feedback, and regional HRF differences that a pairwise model cannot explicitly separate. Our diagnostic conditions isolate these challenges, while Comp10 and Macq28 test their coexistence in larger recurrent networks. However, for fixed X and Y time series and preprocessing, including or excluding other recorded ROIs does not change the X-to-Y score, making focused-circuit analysis feasible without a whole-brain fit.
