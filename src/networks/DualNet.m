function [genNet, chnNet, obsNet] = DualNet(C, T, b)
%DUALNET Constructs the generator, channel, and observer deep learning networks.
%
%   [genNet, chnNet, obsNet] = DualNet(C, T, b) builds and initializes 
%   the three components of the DualNet architecture for capacity estimation.
%
%   Input Arguments:
%       C - Number of channels/features, a scalar.
%       T - Sequence length (number of time steps), a scalar.
%       b - Filter coefficients for the channel network, a vector.
%
%   Output Arguments:
%       genNet - The generator network, a dlnetwork object.
%       chnNet - The channel network, a dlnetwork object.
%       obsNet - The observer network, a dlnetwork object.

    mask = false(C, 1, T); mask(:, :, 1 : 2 : T) = true;
    if canUseGPU, mask = gpuArray(mask); end
    
    genLayers = [
        sequenceInputLayer(C)
        CouplingLayer(mask, 'layer1')
        CouplingLayer(~mask, 'layer2')
        CouplingLayer(mask, 'layer3')
        CouplingLayer(~mask, 'layer4')
        CouplingLayer(mask, 'layer5')
        CouplingLayer(~mask, 'layer6')
        ];
    genNet = dlnetwork(genLayers, 'OutputNames', 'layer6/output');
    
    chnLayers = [
        sequenceInputLayer(C)
        convolution1dLayer(numel(b), C, 'Padding', 'causal', 'Weights', b)
        ];
    chnNet = dlnetwork(chnLayers);
    
    obsLayers = [
        sequenceInputLayer(C)
        CouplingLayer(mask, 'layer1')
        CouplingLayer(~mask, 'layer2')
        CouplingLayer(mask, 'layer3')
        CouplingLayer(~mask, 'layer4')
        CouplingLayer(mask, 'layer5')
        CouplingLayer(~mask, 'layer6')
        ];
    obsNet = dlnetwork(obsLayers).addLayers(additionLayer(6));
    for i = '1' : '6'
        obsNet = connectLayers(obsNet, ...
            ['layer' i '/logdetJ'], ['addition/in' i]);
    end
    obsNet = initialize(obsNet);
    
    if canUseGPU
        genNet = dlupdate(@gpuArray, genNet);
        chnNet = dlupdate(@gpuArray, chnNet);
        obsNet = dlupdate(@gpuArray, obsNet);
    end

end
