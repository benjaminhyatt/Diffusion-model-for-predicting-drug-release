% From data that will be loaded in
global AvgDtt; % D time points
global AvgDyy; % D values (averaged over several experimental trials)
global Avghtt; % h time points
global Avghyy; % h values (averaged over several experimental trials)
global Dm; % number of diffusivity measurements that were averaged over
global hm; % number of h measurements "                               "
global Dsig; % std dev of AvgDyy
global hsig; % std dev of Avghyy
%global AvgFractionalReleasett; % if you have experimental release data
%global AvgFractionalReleaseyy;
%global Qm;
%global Qsig;

% Will be created while running

% When doing spline fits of D and h
global Dsp; % D(t) spline
global hsp; % h(t) spline
global hdotsp; % h'(t) spline
global a0;
global b0;
global counter;
global errorvec;
global herrorvec;
global Derrorvec;   
global Qerrorvec;
global a;
global b;
global finalh;
global finalD;
global initialh;
global initialD;

% when using constant approximation of D and h
global meanD;
global meanh;

% when using an exponential curve to fit to D and h
global Dexptt;
global Dexpyy;
global hexptt;
global hexpyy;
global xD;
global xh;


% here we determine what type of splines will be used 
% 
% (k = 3: quadratic; k=4: cubic; etc.)

global k1; % knots for D spline
global k2; % knots for h spline
global bp1; % breakpoints for D spline
global bp2; % breakpoints for h spline
global semily1; % D spline knot sequence
global semily2; % h spline knot sequence

k1 = 3; 
k2 = 3; 

%bp1 = [0 130 300]; % 06-2019 BSA SD D choice - breakpoints for D: used in splinefitweighted2 *
%bp1 = [0 240 300]; % 07-2019 BSA SD D choice
%bp2 = [0 60 300]; % SD h choice - breakpoints for h: used in splinefitweighted3 *
bp1 = [0 150 300]; % BSA FD and IgG FD D choice (happens to be best for both)
bp2 = [0 80 300]; % FD h choice

semily1 = augknt(bp1, k1); 
semily2 = augknt(bp2, k2); 
