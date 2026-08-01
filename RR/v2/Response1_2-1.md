We thank the reviewer. We expanded validation to 10 conditions spanning 3–28 ROIs and up to 756 directed pairs, with 50 realizations each. They test indirect paths, omitted causes, feedback, modularity, heterogeneous HRFs, their coexistence, and network scale (topologies: Table Y). Table X reports mean±SD; precision, sensitivity, and FPR use thresholds calibrated on the other 49 realizations by LOSO-MCC.

|Net|Method|AUROC|AUPRC|Prec.|Sens.|FPR|
|-|-|-|-|-|-|-|
|CD-e|Dual-flow|.888±.108|.857±.132|.887±.206|.620±.216|.070±.134|
||GCap|.700±.129|.623±.155|.472±.069|.960±.137|.545±.120|
||LiNGAM|.725±.315|.739±.273|.618±.404|.570±.378|.200±.226|
||GIMME|.498±.018|.333±.000|.000±.000|.000±.000|.005±.035|
||GC|.580±.221|.572±.201|.332±.206|.550±.323|.555±.249|
|CD-u|Dual-flow|.858±.104|.830±.112|.890±.273|.470±.120|.040±.093|
||GCap|.668±.130|.579±.125|.455±.089|.860±.227|.525±.154|
||LiNGAM|.713±.318|.726±.270|.568±.400|.570±.404|.220±.206|
||GIMME|.750±.000|.667±.000|1.000±.000|.500±.000|.000±.000|
||GC|.610±.187|.576±.166|.395±.128|.810±.265|.630±.184|
|Diam|Dual-flow|.874±.076|.785±.120|.853±.168|.532±.234|.040±.049|
||GCap|.777±.050|.541±.065|.418±.072|.820±.168|.404±.154|
||LiNGAM|.751±.126|.618±.186|.605±.217|.560±.236|.131±.089|
||GIMME|.505±.032|.259±.047|.040±.198|.012±.063|.003±.013|
||GC|.607±.157|.453±.165|.374±.173|.508±.195|.312±.144|
|Diam(H)|Dual-flow|.910±.079|.844±.120|.927±.154|.560±.218|.022±.045|
||GCap|.799±.070|.591±.103|.462±.066|.847±.204|.344±.135|
||LiNGAM|.787±.172|.675±.220|.620±.247|.660±.247|.149±.111|
||GIMME|.502±.037|.260±.049|.000±.000|.000±.000|.009±.030|
||GC|.589±.233|.494±.226|.394±.279|.507±.303|.311±.200|
|Chain|Dual-flow|.938±.042|.876±.069|.764±.166|.688±.262|.103±.098|
||GCap|.761±.056|.504±.065|.430±.076|.744±.218|.355±.165|
||LiNGAM|.715±.160|.603±.200|.606±.326|.420±.253|.101±.096|
||GIMME|.522±.051|.287±.071|.230±.419|.052±.097|.008±.022|
||GC|.603±.100|.428±.118|.347±.183|.384±.217|.260±.141|
|Chain(H)|Dual-flow|.939±.057|.891±.091|.783±.184|.776±.216|.101±.122|
||GCap|.795±.059|.615±.086|.395±.068|.876±.127|.472±.154|
||LiNGAM|.693±.134|.511±.144|.354±.137|.568±.266|.337±.155|
||GIMME|.605±.024|.409±.036|.990±.071|.208±.040|.001±.009|
||GC|.752±.099|.631±.118|.804±.320|.208±.090|.032±.062|
|Feed|Dual-flow|.889±.071|.866±.091|.769±.160|.790±.183|.202±.162|
||GCap|.613±.043|.534±.051|.476±.040|.748±.144|.555±.134|
||LiNGAM|.563±.147|.545±.141|.511±.243|.305±.173|.192±.108|
||GIMME|.333±.006|.400±.000|.000±.000|.000±.000|.000±.000|
||GC|.514±.111|.495±.104|.411±.058|.750±.182|.715±.165|
|Mod10|Dual-flow|.949±.027|.815±.073|.802±.151|.616±.205|.029±.030|
||GCap|.883±.026|.469±.055|.390±.054|.782±.149|.178±.063|
||LiNGAM|.701±.098|.393±.146|.422±.170|.396±.148|.084±.046|
||GIMME|.517±.034|.153±.055|.230±.384|.038±.064|.005±.010|
||GC|.630±.098|.266±.090|.219±.095|.411±.173|.218±.083|
|Comp10|Dual-flow|.879±.025|.724±.052|.708±.113|.581±.083|.066±.036|
||GCap|.852±.023|.644±.039|.542±.063|.656±.077|.143±.041|
||LiNGAM|.692±.062|.428±.080|.409±.099|.426±.124|.160±.063|
||GIMME|.566±.005|.313±.019|.870±.188|.088±.028|.005±.007|
||GC|.736±.044|.483±.060|.446±.093|.441±.158|.157±.090|
|Macq28|Dual-flow|.884±.018|.521±.042|.573±.118|.453±.105|.029±.018|
||GCap|.846±.021|.391±.037|.427±.082|.403±.074|.043±.019|
||LiNGAM|.578±.038|.110±.022|.102±.020|.305±.078|.200±.046|
||GC|.679±.029|.145±.022|.122±.020|.568±.125|.315±.102|

**Performance and reliability.** Dual-flow achieved the highest AUROC and AUPRC across all ten conditions (AUROC=.858–.949; AUPRC=.521–.891), including Comp10 (.879/.724) and Macq28 (.884/.521). Macq28 has 52 true edges among 756 candidates, giving a random AUPRC of only .069. Across 50 CD-e/u realizations, AUROC/AUPRC were .888±.108/.857±.132 and .858±.104/.830±.112. Each realization contains only two true and four null edges, so sensitivity/FPR change in .50/.25 increments. LOSO-MCC yielded precision/FPR=.887/.070 and .890/.040, with sensitivity=.620/.470. Thus, the larger threshold-dependent SDs partly reflect metric discreteness and threshold selection, while edge ranking remained strong. Overall, Dual-flow maintained strong, competitive performance across individual stressors, their coexistence, and the larger network.

**Pairwise estimation and network scale.** We agree that pairwise fits do not jointly model the full network. As complexity increases, additional drivers, indirect paths, feedback, and HRF differences may affect X and Y without being explicitly separated. Our diagnostic conditions test these factors individually, Comp10 tests their coexistence, and Macq28 extends validation to tens of ROIs. For fixed X/Y data and preprocessing, however, including or excluding other recorded ROIs does not alter the X->Y score, permitting the intended focused-circuit analysis without a whole-brain fit.

