function [transferencia] = modelo2neuronas4AP(frec, tf, i_max, pasomax, g_4AP_max)
%% Resolucion de la ecuacion diferencial

global frecuencia i_amp_max g_4AP;
frecuencia = frec;
i_amp_max = i_max;
g_4AP = g_4AP_max;
tfinal = tf;
tspan = [0 tfinal];

% Condiciones iniciales, obtenidas simulando I = 0
y0 = [-70.0129 -70.0129 0.001 0.001];
options = odeset('MaxStep',pasomax,'AbsTol', [1e-3 1e-3 1e-3 1e-3]);
[t, y] = ode45(@modelo2neuronas, tspan, y0, options);
% [t, y] = ode45(@modelo2neuronas, tspan, y0);

% Variables de estado
V1 = y(:,1);
V2 = y(:,2);
n_4AP_1 = y(:,3);
n_4AP_2 = y(:,4);

figure(1)
plot(t,V1,'k')
hold on
plot(t,V2,'b')
hold off
xlabel('tiempo' )
ylabel('voltaje (mV)')
legend('V_1','V_2')


% Calculamos la impedancia (amplitud maxima de voltaje
% sobre amplitud maxima de corriente inyectada)
inds = find(t>(tfinal-(2/frecuencia)));
ind = inds(1);
vmax1 = max(V1(ind:length(V1)));
vmin1 = min(V1(ind:length(V1)));
v_amp_max1 = abs(vmax1 - vmin1);

vmax2 = max(V2(ind:length(V2)));
vmin2 = min(V2(ind:length(V2)));
v_amp_max2 = abs(vmax2 - vmin2);

transferencia = v_amp_max2/v_amp_max1;