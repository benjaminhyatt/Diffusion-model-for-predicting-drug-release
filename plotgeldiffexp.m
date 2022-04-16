figure(1);
plot(hexptt, hexpyy);
hold on
plot(Avghtt, Avghyy, '*');
xlabel('t');
legend('Optimal h', 'Avg h Data'); 
title('h weighted least-squares exponential fit');
hold off

figure(2);
plot(Dexptt,Dexpyy);
hold on
plot(AvgDtt, AvgDyy, '*');
xlabel('t');
legend('Optimal D', 'Avg D Data'); 
title('D weighted least-squares exponential fit');
hold off

figure(3);
plot(hexptt,hdotyy);
hold on
xlabel('t');
ylabel('hdot');
title('hdot (derivative of h weighted least-squares exponential fit)');
legend('hdot');
ylim([0 .01]);
hold off

figure(4);
plot(tt,Qt);
hold on
plot(AvgFractionalReleasett, AvgFractionalReleaseyy, '*');
xlabel('t');
ylabel('Total Release');
title('igG Total Release over Time');
legend('WLS Exponential Fit Model Prediction', 'Fractional Release Data', 'WLS Spline Fit Model Prediction');
ylim([0 1]);
hold off