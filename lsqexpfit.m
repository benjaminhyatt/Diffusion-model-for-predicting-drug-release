% Generates a weighted fit of the form a-be^{-ct}
function [tf, yf, yfder, x] = lsqexpfit(t,y,yweight)

% data being fitted
xdata = t;
ydata = y;

% weights by how many trials were used to obtain a given data point (t,y)
weights = ones(length(yweight),1);
for ii=1:length(yweight)
    weights(ii)=weights(ii)*yweight(ii);
end
weights=weights';

% initial guesses for a, b, and c
a0 = ydata(length(ydata));
b0 = 0.1;
c0 = 0.1;
lb = [0,0,0];
ub = [inf,inf,inf];

% define the parameterized curve
fun = @(x) weights.*(x(1)-x(2)*exp(-x(3)*xdata) - ydata);

% define initial guess input
x0 = [a0, b0, c0];

% obtain optimal [a,b,c]
x = lsqnonlin(fun,x0,lb,ub);

% define the function for the fit curve
curve = @(x,times) (x(1)-x(2)*exp(-x(3)*times));

% generate the corresponding curve from optimal [a,b,c]
%tf = linspace(xdata(1),xdata(end));
tf = linspace(xdata(1),xdata(end),(xdata(end)+1)); % will always contain times in increments of 1 minute
yf = curve(x,tf);


% for hdot curve
dercurve = @(x,xdata) (x(2)*(x(3)*exp(-x(3)*xdata)));
yfder = dercurve(x,tf);

%lserror = sqrt((sum(y-fnval(yf, tf))).^2); 

end