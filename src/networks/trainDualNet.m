function [ccAvg, ccSqAvg, iter, incAvg] = trainDualNet(genNet, chnNet, obsNet, w, options)
%TRAINDUALNET Trains the DualNet models to estimate channel capacity.
%
%   [ccAvg, ccSqAvg, iter, incAvg] = trainDualNet(genNet, chnNet, obsNet, w, options) 
%   performs custom training loops using Adam optimization to iteratively 
%   calculate and refine the channel capacity estimation.
%
%   Input Arguments:
%       genNet - The generator network, a dlnetwork object.
%       chnNet - The channel network, a dlnetwork object.
%       obsNet - The observer network, a dlnetwork object.
%       w - Residual noise signal, an array.
%       options - Training options, a struct containing hyperparameters.
%
%   Output Arguments:
%       ccAvg - Exponential moving average of the channel capacity, a scalar.
%       ccSqAvg - Exponential moving avg. of the squared channel capacity, a scalar.
%       iter - Total number of training iterations completed, a scalar.
%       incAvg - Exponential moving average of the capacity increment, a scalar.

    w = single(w); if canUseGPU, w = gpuArray(w); end 
    [C, ~, T] = size(genNet.Layers(2).Mask); B = options.MiniBatchSize; 

    obsNet_w = obsNet;

    [genAvgGrad, genAvgSqGrad, obsAvgGrad, obsAvgSqGrad, obsAvgGrad_w, obsAvgSqGrad_w] = deal([]); 
    incAvg = 0; 

    for iter = 1 : options.MaxIterations
        z1 = randn(C, B, T, 'like', w); z1 = dlarray(z1, 'CBT'); 
        idx = randi(numel(w), size(z1), 'like', w); 
        w_idx = dlarray(w(idx), 'CBT');
        [genGrad, obsGrad, hy, obsGrad_w, hw] = dlfeval(@netGrad, ...
            genNet, chnNet, obsNet, obsNet_w, z1, w_idx, options.RMS);

        cc = hy - hw;
        
        EMADecayFactor = options.EMADecayFactor;
        if iter == 1, ccAvg = cc; ccSqAvg = cc ^ 2; end
        ccAvg = EMADecayFactor * ccAvg + (1 - EMADecayFactor) * cc;
        ccSqAvg = EMADecayFactor * ccSqAvg + (1 - EMADecayFactor) * cc ^ 2;
        inc = cc - ccAvg; 
        incAvg = EMADecayFactor * incAvg + (1 - EMADecayFactor) * inc;

        if options.Verbose && mod(iter, options.VerboseFrequency) == 0 
            fprintf(' %s: %4d |', 'iter', iter);
            fprintf(' %s: %-12g |', 'cc', cc);
            fprintf(' %s: %-12g |', 'ccAvg', ccAvg);
            fprintf(' %s: %-+12g |', 'inc', inc);
            fprintf(' %s: %-+12g |', 'incAvg', incAvg);
            fprintf('\n');
        end

        if iter > options.CheckpointFrequency ...
                && abs(incAvg) < options.incTolerance
            fprintf(' *** Training terminates *** \n'); 
            break;
        end

        [genNet, genAvgGrad, genAvgSqGrad] = adamupdate(...
            genNet, genGrad, genAvgGrad, genAvgSqGrad, iter);
        [obsNet, obsAvgGrad, obsAvgSqGrad] = adamupdate(...
            obsNet, obsGrad, obsAvgGrad, obsAvgSqGrad, iter);
        [obsNet_w, obsAvgGrad_w, obsAvgSqGrad_w] = adamupdate(...
            obsNet_w, obsGrad_w, obsAvgGrad_w, obsAvgSqGrad_w, iter);
    end
end

function [genGrad, obsGrad, hy, obsGrad_w, hw] = netGrad(genNet, chnNet, obsNet, obsNet_w, z1, w, pwr)    
    x = forward(genNet, z1); px = mean(x .^ 2, 'all'); 
    x = x * sqrt(pwr / px);
    y = forward(chnNet, x) + w; 
    [z2, logdetJ] = forward(obsNet, y); 
    hy = log(2 * pi) / 2 + mean(z2 .^ 2, 'all') / 2 - mean(logdetJ);
    obsGrad = dlgradient(hy, obsNet.Learnables);
    genGrad = dlgradient(-hy, genNet.Learnables);

    [z2, logdetJ] = forward(obsNet_w, w); 
    hw = log(2 * pi) / 2 + mean(z2 .^ 2, 'all') / 2 - mean(logdetJ);
    obsGrad_w = dlgradient(hw, obsNet_w.Learnables);
end
