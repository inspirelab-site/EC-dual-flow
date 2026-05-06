% startup.m
% Run this once from the root of the cc-estimation repo.

repoRoot = fileparts(mfilename('fullpath'));

addpath(genpath(fullfile(repoRoot, 'data')));
addpath(genpath(fullfile(repoRoot, 'src')));
addpath(genpath(fullfile(repoRoot, 'scripts')));

fprintf('Added cc-estimation source folders to MATLAB path:\n%s\n', repoRoot);