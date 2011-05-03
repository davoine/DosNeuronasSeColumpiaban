clear all
close all
clc

tfinal = 10;
tspan = [0 tfinal];

% Condiciones iniciales, obtenidas simulando I = 0
y0 = [0 0];
options = odeset('MaxStep',1e-4,'AbsTol', [1e-4 1e-3]);
[t, y] = ode45(@modelo2neuronas, tspan, y0, options);
% [t, y] = ode45(@modelo2neuronas, tspan, y0);

tumb = 5;
% I = 650*stepfun(t,tumb)*sin((t-tumb)^3);
% I = 0;
% I = 2*(t-tumb)*stepfun(t,tumb);
I = 6*stepfun(t,tumb);

% Variables de estado
V1 = y(:,1);
V2 = y(:,2);

figure(1)
plot(t,V1,'k')
hold on
plot(t,V2,'b')
hold off
xlabel('tiempo' )
ylabel('voltaje (mV)')
legend('V_1','V_2')