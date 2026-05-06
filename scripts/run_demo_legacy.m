%% load data
load('example_data.mat');
% nTimepoints x nROI, where the i-th column is the i-th ROI timeseries.

%% process data
S = data;
[nTime, nROI] = size(S);

alpha = 0.05; 
max_lag = 4;   % maximum permissible lag for GC to avoid overfitting
Nmax = 15;     % maximum lag for FIR, e.g., HRF window = 15 s
Lwin = inf;    % window length

GC = zeros(nROI, nROI);

%%%% channel capacity estimates        
[Nh, R_std, R_bic, CC_gauss, CC_distn] = nnls_mat(S, Lwin, 0, Nmax);

%%%% pairwise GC estimates
for i = 1:nROI
    for j = 1:nROI
        if i ~= j
            % Check granger_cause convention:
            % If granger_cause(x, y) tests whether x causes y,
            % then this means j -> i or i -> j depending on convention.
            [GC(i,j), ~] = granger_cause(S(:,j), S(:,i), alpha, max_lag);
        else
            GC(i,j) = 0;
        end
    end
end

save('EC_estimated.mat', 'CC_distn', 'CC_gauss', 'GC');