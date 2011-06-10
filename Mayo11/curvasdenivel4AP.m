V = [-65:0.5:-30]; % Voltaje en mV

% Parametros
g_L = 1e4; % g = 1/R_in, R_in = 100e6 Ohm
C = 200; % C = 20e-3*g
g_j = 2850; % g_j = 2850 pS
E_L = -51; % en mV
E_K = -92; % en mV
g_4AP = 3000;
I = 1000;
tau_4AP = 2;
% Curvas
n_4AP_inf = (1+exp(-(V+43)/3.9)).^(-1);
V_nullcline = (I-g_L*(V-E_L))./(g_4AP*(V-E_K));

figure(1)
xlabel('Voltaje (mV)')
plot(V,n_4AP_inf,'k')
hold on
plot(V,V_nullcline,'b')
hold off
axis tight
legend('dn/dt','dV/dt=0')

syms v N_4AP_inf f J
N_4AP_inf = (1+exp(-(v+43)/3.9))^(-1);
f = [-g_L*(v-E_L)-g_4AP*N_4AP_inf*(v-E_K); N_4AP_inf/tau_4AP];
J = jacobian(f,v);