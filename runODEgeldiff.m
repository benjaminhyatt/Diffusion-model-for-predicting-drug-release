% SET UP INITIAL CONDITION IN COLUMN VECTOR v0 OF SIZE N+1 by 1. 

M = 1;  % Total amount of substance in the initial condition. 
N = 100;  % Keep N even for use of Simpson's.
c0 = M/(1 - 1/(3*N));  % Consistent with Simpson's rule. 
s0 = c0*ones(N,1); % Initial condition on concentration; 
% this also serves as an initial condition when solving for Q(t) 
q0 = 0; % total release at t = 0
v0 = [s0; q0]; % Vector of initial conditions
T = 300; % Time interval.

% Declare global variables - note, some spline parameters are set in here
declareglobals;

% LOAD IN DATA HERE 
%load('07-2019 BSA SD data.mat');
%load('05-2019 h BSA FD data.mat');
%load('05-2019 h igG data.mat');
%load('08-2019 igG data.mat');

% Data unit conversions, if necessary

%AvgDyy=((1000^2)/60)*(10^-8)*AvgDyy; %mm^2/min to cm^2/s
%Dsig=((1000^2)/60)*(10^-8)*Dsig;
%Avghyy=2*Avghyy; %mm/2 to cm/2
%hsig=2*hsig;


% SET UP D AND h REPRESENTATIONS - SEVERAL OPTIONS 
% (can toggle different sections on/off, or make own modifications as 
% desired. Keep in mind you will have to toggle corresponding lines of 
% code in geldiff.m)

% Option 1: spline fits for D and h
[~, ~, a0] = splinefitweighted(AvgDtt, AvgDyy, Dm, bp1, k1); % when using declareglobals2 for splines
[~, ~, b0] = splinefitweighted(Avghtt, Avghyy, hm, bp2, k2); % when using declareglobals2 for splines
Dsp = spmak(semily1, a0'); 
hsp = spmak(semily2, b0'); 
hdotsp = fnder(hsp);

% Option 2: constant D and h
% Note: we found it convenient to simply call splinefitweighted again here,
% to create a constant spline fit. However, a spline fit for this approach
% is clearly unnecessary, so this can be modified if desired.

% Calculate meanD and meanh
%meanD = mean(AvgDyy);
%meanh = mean(Avghyy); 

% Set up "splines" 
%[~, ~, a0] = splinefitweighted(AvgDtt, meanD, Dm, bp1, k1); 
%[~, ~, b0] = splinefitweighted(Avghtt, meanh, hm, bp1, k1); 
%Dsp = spmak(semily1, a0'); 
%hsp = spmak(semily2, b0'); 
%hdotsp = fnder(hsp); % should be zero in this case

% Option 3: exponential curve fits for D and h
%[Dexptt, Dexpyy, ~, xD] = lsqexpfit(AvgDtt,AvgDyy,Dm); 
%[hexptt, hexpyy, hdotyy, xh] = lsqexpfit(Avghtt,Avghyy,hm);


% CALL SOLVER 
% **This will involve going into geldiff.m** and ensuring that the
% correct options for D and h are being ran, and other options are
% commented out. 

% Call ODE solver.
[tt,vt] = ode23s(@geldiff,[0 T],v0); % [tt,vt] = ode23s(vdot=[sdot;Qdot],[0 T],v0) 

% Organize the results
tt=tt'; vt=vt';
st = vt(1:N,:); % Concentration S(tt) along N grid points: First N rows of vt
Qt = vt(N+1,:); % Fractional Release Q(tt): N+1th row of vt

% PLOT RESULTS (optional)
%plotgeldiff; % works for Option 1 (or Option 2)
%plotgeldiffexp; % works for Option 3


