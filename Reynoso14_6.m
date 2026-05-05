% Temperature Application
% Constants
Ti = 70;     
Tb = 170;    

% Use ode to Solve from 0 to 40 seconds
[t,T] = ode45(@(t,T) (Tb - T)/10, [0 40], Ti);

% Temperatures at specific times
T10 = interp1(t,T,10);
T20 = interp1(t,T,20);
T40 = interp1(t,T,40);

fprintf('Temperature after 10 s: %.1f F\n', T10);
fprintf('Temperature after 20 s: %.1f F\n', T20);
fprintf('Temperature after 40 s: %.1f F\n', T40);

% Time to reach 160 degrees F
target = 160;
[~, idx] = min(abs(T - target));
t_target = t(idx);

fprintf('Time to reach 160 F: %.1f seconds\n', t_target);

% Plotting 
plot(t,T,'b','LineWidth',1.2)
grid on
title('Temperature Change of Object in 170 F Bath')
xlabel('Time (seconds)')
ylabel('Temperature (F)')
ylim([0 180])