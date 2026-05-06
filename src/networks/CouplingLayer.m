classdef CouplingLayer < nnet.layer.Layer
    properties
        Mask 
    end
    properties (Learnable)
        NetS
        NetT
    end
    methods
        function layer = CouplingLayer(mask, name)  
        %COUPLINGLAYER Constructs a custom affine coupling layer for the network.
        %
        %   layer = CouplingLayer(mask, name) initializes the coupling layer
        %   with a specified binary mask and layer name.
        %
        %   Input Arguments:
        %       mask - Binary mask for partitioning the input, a logical array.
        %       name - Name of the layer, a string or character vector.
        %
        %   Output Arguments:
        %       layer - The initialized CouplingLayer object.
        %----------------------------------------------------------------
            layer.Mask = logical(mask); C = size(mask, 1); 
            layer.NetS = convNet(C); layer.NetT = convNet(C);
            layer.NumOutputs = 2;
            layer.Name = name;
            layer.InputNames = {'input'};
            layer.OutputNames = {'output', 'logdetJ'};
        end

        function [z, logdetJ] = predict(layer, x) 
        %PREDICT Forward pass for the CouplingLayer.
        %
        %   [z, logdetJ] = predict(layer, x) applies the affine coupling 
        %   transformation to the input data.
        %
        %   Input Arguments:
        %       layer - The CouplingLayer object.
        %       x - Input data, an array.
        %
        %   Output Arguments:
        %       z - Transformed output data, an array.
        %       logdetJ - Log-determinant of the Jacobian, an array.
        %----------------------------------------------------------------
            x1 = dlarray(x .* layer.Mask, 'CBT'); 

            s = forward(layer.NetS, x1) .* ~layer.Mask;
            t = forward(layer.NetT, x1) .* ~layer.Mask;
            s = 2 * tanh(s / 2); % soft clipping
            z = x .* exp(s) + t; logdetJ = mean(s, 'all');  
            
            z = stripdims(z); logdetJ = stripdims(logdetJ);
        end
    end
end

function net = convNet(C)
%CONVNET Creates a simple 1D convolutional neural network.
%
%   net = convNet(C) generates a small sequence of 1D convolution
%   and ReLU layers used internally by the CouplingLayer.
%
%   Input Arguments:
%       C - Number of channels/features, a scalar.
%
%   Output Arguments:
%       net - The constructed 1D convolutional network, a dlnetwork.
%----------------------------------------------------------------
    filterSize = 3; numFilters = 32;
    layers = [
        sequenceInputLayer(C)
        convolution1dLayer(filterSize, numFilters, 'Padding', 'same')
        reluLayer
        convolution1dLayer(filterSize, C, 'Padding', 'same', ...
        'WeightsInitializer', 'zeros')
    ];
    net = dlnetwork(layers);
end
