figure(1);
fnplt(hsp);
hold on
plot(Avghtt, Avghyy, '*');
xlabel('t');
legend('Optimal h', 'Avg h Data'); 
title('h spline - FD Gel');
hold off

figure(2);
fnplt(Dsp)
hold on
plot(AvgDtt, AvgDyy, '*');
xlabel('t');
legend('Optimal D', 'Avg D Data'); 
title('D spline - FD BSA Gel');
hold off

figure(3);
fnplt(hdotsp);
hold on
xlabel('t');
ylabel('hdot');
title('hdot (derivative of hspline)');
legend('AutoUpdate', 'on');
ylim([0 .03]);
hold off

figure(4);
plot(tt,Qt);
hold on
%plot(AvgFractionalReleasett, AvgFractionalReleaseyy, '*'); if you have
% data to compare to the computed Qt
xlabel('t');
ylabel('Total Release');
title('FD IgG Total Release over Time');
legend('Model Prediction', 'Fractional Release Data');
ylim([0 1]);
hold off

