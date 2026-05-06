function [Nh, R_std, R_bic, cap1, cap2, win_ind] = nnls_mat(S, Lwin, Lovp, Nmax)
%NNLS_MAT Calculates selected connectivity measures between each pair of 
%         signals with a sliding window.
%
%   [Nh, R_std, R_bic, cap1, cap2, ind] = nnls_mat(S, Lwin, Lovp, Nmax) 
%   performs non-negative least squares regression for each pair of column 
%   vectors of S with a sliding window of length Lwin, and returns the 
%   connectivity measures Nh, R_std, R_bic, and cap1-2, and the starting index
%   of each window ind.
%
%   Input Arguments:
%       S - The signals, a matrix. Each column of S is the signal of a ROI.
%       Lwin - The length of window, a scalar. 
%       Lovp - The length of window overlap, a scalar. 
%       Nmax - The maximum model order, a scalar. 
%
%   Output Arguments:
%       Nh - Model order selected by the BIC, 
%           a 3-D array of size nROIs-by-nROIs-by-nWins.
%           Nh(i, j, :) represents the model i -> j. 
%       R_std - Coefficient of simple correlation, 
%           a 3-D array of size nROIs-by-nROIs-by-nWins. 
%       R_bic - Coefficient of multiple correlation, 
%           a 3-D array of size nROIs-by-nROIs-by-nWins.
%       cap1 - Gaussian channel capacity
%           a 3-D array of size nROIs-by-nROIs-by-nWins.
%       cap2 - Distribution-aware channel capacity
%           a 3-D array of size nROIs-by-nROIs-by-nWins.
%       win_ind - Starting index of each window, 
%           a 3-D array of size 1-by-1-by-nWins.
%----------------------------------------------------------------

    [L, nROIs] = size(S); Lwin = min(Lwin, L + 1 - Nmax);
    win_ind = Nmax : Lwin - Lovp : L + 1 - Lwin; 
    win_ind = reshape(win_ind, 1, 1, []); nWins = length(win_ind);

    Nh = nan(nROIs, nROIs, nWins); 
    cap1 = nan(nROIs, nROIs, nWins);
    cap2 = nan(nROIs, nROIs, nWins);
    R_std = nan(nROIs, nROIs, nWins);
    R_bic = nan(nROIs, nROIs, nWins);   

    parfor index = 1 : nROIs * nROIs * nWins
        [r, c, t] = ind2sub([nROIs, nROIs, nWins], index);
        
        if r == c, continue; end
    
        ind_array = win_ind; ind = ind_array(t); S_mat = S;
        x = S_mat(ind - Nmax + 1 : ind + Lwin - 1, r);
        y = S_mat(ind - Nmax + 1 : ind + Lwin - 1, c);
                
        [Nh(index), R_std(index), R_bic(index), cap1(index), cap2(index)] ...
            = nnls_vec(x, y, Nmax);
    end   
end
