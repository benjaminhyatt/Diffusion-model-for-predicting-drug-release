function vdot=geldiff(t,v)

declareglobals;

N = length(v)-1;

% Option 1 (or Option 2): D, h, hdot when splines are used for hsp and Dsp 
% (also works when constant values are used to make the splines)
D = fnval(Dsp,t); h = fnval(hsp,t); hdot = fnval(hdotsp,t);

% Option 3: D, h, hdot when the exponential fit is used
%D = xD(1)-xD(2)*exp(-xD(3)*t); h = xh(1)-xh(2)*exp(-xh(3)*t); hdot = xh(2)*xh(3)*exp(-xh(3)*t);

A = D/(h^2);
b = hdot/h;

%returns if A or b is NaN
if ((isnan(A)==1) || (isnan(b)==1))
    return
end

vdot = zeros(N+1,1);

s = v(1:N); s(N+1) =0; 

sdot = zeros(N,1); 
sdot(1) = N^2*A*(2*s(2)-2*s(1));
Qdot = sdot(1); %initializes vector to store the rate of release
for i=2:N
    sdot(i)=N^2*A*(s(i+1)+s(i-1)-2*s(i))+((i*b)/2)*(s(i+1)-s(i-1));
    if mod(i,2) == 0 % multiplies by 4 and adds to total sum if index is even
       Qdot = Qdot + 4 * sdot(i);
    else % multiplies by 2 and adds to total sum if index is odd
       Qdot = Qdot + 2 * sdot(i);
    end
end

Qdot=-Qdot/(3*N); %The rate of release of the drug: -(h/3)(vdot(1,t)+4vdot(2,t)+2vdot(3,t)+4vdot(4,t)+...+4vdot(n,t))
vdot = [sdot;Qdot];

