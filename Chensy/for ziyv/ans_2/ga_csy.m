function [x,fval,exitflag,output,population,score] = ga_csy(nvars,PopInitRange_Data,PopulationSize_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = gaoptimset;
%% Modify options setting
options = gaoptimset(options,'PopulationType', 'custom');
options = gaoptimset(options,'PopInitRange', PopInitRange_Data);
options = gaoptimset(options,'PopulationSize', PopulationSize_Data);
options = gaoptimset(options,'CreationFcn', @zhongqun);
options = gaoptimset(options,'CrossoverFcn', @crossoversinglepoint);
options = gaoptimset(options,'MutationFcn', @mutationgaussian);
options = gaoptimset(options,'Display', 'off');
[x,fval,exitflag,output,population,score] = ...
ga(@fitnessfun,nvars,[],[],[],[],[],[],[],[],options);
