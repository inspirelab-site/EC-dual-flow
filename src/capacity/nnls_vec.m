function [Nh, R_std, R_AICc, cap1, cap2] = nnls_vec(x, y, Nmax)
%NNLS_VEC Calculates selected connectivity measures between two signals.
%
%   [Nh, R_std, R_AICc, cap] = nnls_vec(x, y, Nmax) performs non-negative 
%   least squares regression of y on x, and returns the connectivity 
%   measures Nh, R_std, R_AICc, and cap.
%
%   Input Arguments:
%       x - The regressor signal, a column vector.
%       y - The response signal, a column vector.
%       Nmax - The maximum model order, a scalar.
%
%   Output Arguments:
%       Nh - Model order selected by the AICc, a scalar.
%       R_std - Coefficient of simple correlation, a scalar.
%       R_AICc - Coefficient of multiple correlation, a scalar.
%       cap1 - Gaussian channel capacity in bits/sample, a scalar.
%       cap2 - Distribution-aware channel capacity in bits/sample, a scalar.
%---------------------------------------------------------------

    Y = y(Nmax : end); numObs = length(Y);
    X = toeplitz(x(Nmax : end), x(Nmax : -1 : 1));
    Y = zscore(Y, 1); X = zscore(X, 1);

    AICc_min = inf; k = Nmax; 
    while k >= 0 
        [b, resnorm] = lsqnonneg(X(:, 1 : k), Y); % Y == X * b + residual;
        k = find(b > 0, 1, 'last'); if isempty(k), k = 0; end 
        % BIC = numObs * log(resnorm / numObs) + k * log(numObs); % BIC
        % AIC = numObs * log(resnorm / numObs) + k * 2; % AIC
        AICc = numObs * log(resnorm / numObs) + ...
            k * 2 * numObs / (numObs - k - 1); % AICc
        if AICc < AICc_min
            AICc_min = AICc; Nh = k; 
            b_ = b(1 : k, :); resnorm_ = resnorm;
        end
        k = k - 1;
    end
    b = b_; resnorm = resnorm_; 

    R_std = corr(Y, X(:, 1));     
    R_AICc = corr(Y, X(:, 1 : Nh) * b); 

    v = resnorm / numObs; 
    n = 512; G = fft(b, n); S = v ./ abs(G) .^ 2; % EIN PSD 
    S = sort(S);
    for i = 1 : n
        lambda = n / i + mean(S(1 : i));
        if i == n || lambda <= S(i + 1) 
            cap1 = sum(log2(lambda ./ S(1 : i))) / (2 * n); % bit per sample
            break;
        end
    end
    if Nh == 0, cap2 = nan; else
        w = Y - X(:, 1 : Nh) * b; 
        cap2 = estimateCapacity(b, w); 
    end
end
