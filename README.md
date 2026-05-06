# Distribution-Aware Channel Capacity for Brain Effective Connectivity

MATLAB implementation for estimating effective connectivity from multivariate brain time-series data using Gaussian and empirical distribution-aware channel-capacity estimators, with pairwise Granger causality as a baseline.

This repository accompanies the paper:

**Beyond Gaussian Assumptions in Brain Effective Connectivity: Distribution-Aware Channel Capacity with Adversarial Flows**

Authors: Jianan Jian, Nurahmed Multezem, Benjamin Li, Jacob Kang, Nan Xu

---

## Overview

Effective-connectivity estimation from brain-signal measurements often relies on Gaussian residual assumptions. This repository provides code for estimating directed interactions using a finite-impulse-response channel model and comparing:

1. **Gaussian channel capacity**  
   Capacity estimated under a Gaussian residual-noise assumption.

2. **Distribution-aware channel capacity**  
   Capacity estimated using empirical residual resampling and a DualNet/flow-based estimator.

3. **Pairwise Granger causality**  
   A standard baseline method for directed interaction estimation.

The input is a multivariate time-series matrix:

```matlab
nTimepoints x nROI
```

where each column is the time series of one ROI.

---

## Repository Structure

```text
cc-estimation/
├── README.md
├── startup.m
├── requirements.md
├── CITATION.cff
├── src/
│   ├── capacity/
│   │   ├── nnls_mat.m
│   │   ├── nnls_vec.m
│   │   └── estimateCapacity.m
│   ├── networks/
│   │   ├── DualNet.m
│   │   ├── CouplingLayer.m
│   │   └── trainDualNet.m
│   ├── baselines/
│   │   └── granger_cause.m
│   └── pipeline/
│       └── estimate_effective_connectivity.m
├── scripts/
│   ├── run_demo.m
│   ├── run_demo_legacy.m
│   └── reproduce_results.m
├── data/
│   └── example_data.mat
├── results/
├── docs/
│   ├── data_format.md
│   └── troubleshooting.md
└── tests/
    └── test_smoke.m
```

---

## Requirements

This code is written in MATLAB.

Recommended environment:

- MATLAB R2023b or newer
- Deep Learning Toolbox
- Statistics and Machine Learning Toolbox
- Optimization Toolbox
- Parallel Computing Toolbox

A GPU is recommended for the DualNet-based distribution-aware capacity estimator, but the code can also run on CPU for smaller examples.

See `requirements.md` for additional notes.

---

## Installation

Clone or download this repository.

```bash
git clone https://github.com/inspirelab-site/cc-estimation.git
cd cc-estimation
```

In MATLAB, move to the repository root and run:

```matlab
startup
```

This adds the `src/` and `scripts/` folders to the MATLAB path.

You can check that MATLAB can find the main functions by running:

```matlab
which nnls_mat
which DualNet
which granger_cause
which estimate_effective_connectivity
```

You should see paths pointing to the corresponding files inside the repository.

---

## Quick Demo

From the repository root in MATLAB, run:

```matlab
startup
run_demo
```

Alternatively, you can run the demo script directly:

```matlab
run('scripts/run_demo.m')
```

This runs the example pipeline using:

```text
data/example_data.mat
```

and saves the estimated effective-connectivity matrices to:

```text
results/EC_estimated.mat
```

---

## Input Data Format

The input `.mat` file should contain a variable named `data`.

```matlab
load('data/example_data.mat')
size(data)
```

The expected format is:

```matlab
nTimepoints x nROI
```

where:

- rows are time points
- columns are ROIs or channels

For example, if the data contain 1200 time points and 100 ROIs:

```matlab
size(data)

% ans =
%        1200         100
```

---

## Running on Your Own Data

Prepare a `.mat` file containing a variable named `data`.

Then run:

```matlab
startup

params = struct();
params.alpha = 0.05;     % significance level for GC
params.max_lag = 4;      % maximum lag for Granger causality
params.Nmax = 15;        % maximum FIR lag/order
params.Lwin = inf;       % window length; use inf for whole time series
params.Lovp = 0;         % window overlap

results = estimate_effective_connectivity( ...
    'path/to/your_data.mat', ...
    'results/my_run', ...
    params);
```

The output will be saved as:

```text
results/my_run/EC_estimated.mat
```

---

## Output Variables

The output `.mat` file contains:

| Variable | Description |
|---|---|
| `CC_gauss` | Gaussian channel-capacity estimates |
| `CC_distn` | Empirical distribution-aware channel-capacity estimates |
| `GC` | Pairwise Granger-causality baseline |
| `Nh` | Selected FIR model order |
| `R_std` | Standard correlation-related summary from the FIR fitting stage |
| `R_bic` | BIC-based model-fit summary |
| `win_ind` | Window indices, when sliding-window estimation is used |
| `params` | Parameters used for the run |

---

## Direction Convention

For Granger causality, this repository uses the convention:

```matlab
GC(source, target) = source -> target
```

The bundled `granger_cause(x, y, ...)` function tests whether `y` Granger-causes `x`.

Therefore, the pipeline calls:

```matlab
granger_cause(S(:, target), S(:, source), ...)
```

to store the result as:

```matlab
GC(source, target)
```

The direction convention for the channel-capacity matrices follows the implementation in `nnls_mat.m`.

---

## Reproducing Paper Results

The full paper experiments may require external or restricted datasets. After obtaining and preprocessing the relevant datasets, edit the paths in:

```text
scripts/reproduce_results.m
```

Then run in MATLAB:

```matlab
startup
reproduce_results
```

Suggested experiment organization:

```text
results/
├── demo/
├── hcp_motor/
├── rat_lfp_bold/
└── mouse_ca_fmri/
```

Large datasets and generated result files should not be committed directly to GitHub. Use dataset accession links, institutional storage, GitHub Releases, or Zenodo for large files.

---

## Testing

A lightweight smoke test is provided in:

```text
tests/test_smoke.m
```

Run from MATLAB:

```matlab
startup
runtests('tests')
```

This checks that the main pipeline can run on synthetic data and returns the expected output fields.

---

## Notes on Pretrained Models

No pretrained model is required for the current implementation.

The DualNet estimator is trained as part of the capacity-estimation procedure for each fitted channel and residual distribution. If future versions include cached trained models or precomputed outputs, they should be released separately through GitHub Releases, Zenodo, or another archival data repository.

---

## License

Please add a license before public release.

For academic research-code release, common choices include:

- MIT License
- BSD 3-Clause License
- Apache License 2.0

---
University of Maryland, College Park  

Repository: https://github.com/inspirelab-site/cc-estimation
