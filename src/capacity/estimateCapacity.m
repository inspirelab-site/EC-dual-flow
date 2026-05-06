function cc = estimateCapacity(b, w)
%ESTIMATECAPACITY Estimates channel capacity using a trained DualNet.
%
%   cc = estimateCapacity(b, w) configures the training options, constructs 
%   the DualNet architecture, and trains it to estimate the channel capacity.
%
%   Input Arguments:
%       b - Filter coefficients for the channel, a vector.
%       w - Residual noise signal, a column vector.
%
%   Output Arguments:
%       cc - Estimated channel capacity, a scalar.

    options = struct('MiniBatchSize', 256, 'MaxIterations', 5e3, ...
        'Verbose', true, 'VerboseFrequency', 1000, ...
        'CheckpointFrequency', 100, 'EMADecayFactor', .9, 'RMS', 1, ...
        'GradientThreshold', 2, 'incTolerance', 1e-6);
    C = 1; T = 1024;
    [genNet, chnNet, obsNet] = DualNet(C, T, b);
    cc = trainDualNet(genNet, chnNet, obsNet, w, options); 
end
