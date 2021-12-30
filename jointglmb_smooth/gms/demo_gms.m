% This is the demo script for the (joint prediction and update) implementation of the Generalized Labeled Multi-Bernoulli filter 
% and the partial smoothing technique proposed in
% T.T.D. Nguyen and D.Y. Kim, "GLMB Tracker with Partial Smoothing," Sensors, Vol. 19, No. 20, pp. 4419, 2019. 
% https://https://www.mdpi.com/1424-8220/19/20/4419
% B.-T. Vo, and B.-N. Vo, "An Efficient Implementation of the Generalized Labeled Multi-Bernoulli Filter," IEEE Trans. Signal Processing, Vol. 65, No. 8, pp. 1975-1987, 2017.
% http://ba-ngu.vo-au.com/vo/VVH_FastGLMB_TSP17.pdf
% corresponding to the (separate prediction and update) implementation proposed in
% B.-N. Vo, B.-T. Vo, and D. Phung, "Labeled Random Finite Sets and the Bayes Multi-Target Tracking Filter," IEEE Trans. Signal Processing, Vol. 62, No. 24, pp. 6554-6567, 2014
% http://ba-ngu.vo-au.com/vo/VVP_GLMB_TSP14.pdf
% of the original filter proposed in
% B.-T. Vo, and B.-N. Vo, "Labeled Random Finite Sets and Multi-Object Conjugate Priors," IEEE Trans. Signal Processing, Vol. 61, No. 13, pp. 3460-3475, 2013.
% http://ba-ngu.vo-au.com/vo/VV_Conjugate_TSP13.pdf
%
% ---BibTeX entry
% @ARTICLE{GLMB_PartialSmooth,
%   author    = {Nguyen, Tran Thien Dat and Kim, Du Yong},
%   title     = {GLMB Tracker with Partial Smoothing},
%   journal   = {Sensors},
%   year      = {2019},
%   volume    = {19},
%   number    = {20},
%   pages     = {4419},
%   publisher = {Multidisciplinary Digital Publishing Institute}}
%
% @ARTICLE{GLMB3,
% author={B.-N. Vo and B.-T. Vo and H. Hung},
% journal={IEEE Transactions on Signal Processing},
% title={An Efficient Implementation of the Generalized Labeled Multi-Bernoulli Filter},
% year={2017},
% month={Apr}
% volume={65},
% number={8},
% pages={1975-1987}}
%
% @ARTICLE{GLMB2,
% author={B.-T. Vo and B.-N. Vo and D. Phung},
% journal={IEEE Transactions on Signal Processing},
% title={Labeled Random Finite Sets and the Bayes Multi-Target Tracking Filter},
% year={2014},
% month={Dec}
% volume={62},
% number={24},
% pages={6554-6567}}
%
% @ARTICLE{GLMB1,
% author={B.-T. Vo and B.-N. Vo
% journal={IEEE Transactions on Signal Processing},
% title={Labeled Random Finite Sets and Multi-Object Conjugate Priors},
% year={2013},
% month={Jul}
% volume={61},
% number={13},
% pages={3460-3475}}
%---
disp('Simulating the scenario ...')
model= gen_model;
truth= gen_truth(model);
meas=  gen_meas(model,truth);
disp('Filtering ...')
[est, est_smooth]=   run_filter(model,meas);
disp('Plotting standard estimates ...')
handles= plot_results(model,truth,meas,est);
disp('Plotting partially smoothed estimates ...')
handles_smooth= plot_results(model,truth,meas,est_smooth);