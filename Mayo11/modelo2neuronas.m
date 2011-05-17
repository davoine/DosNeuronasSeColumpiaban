%% Modelo
% 

function dydt = modelo2neuronas(t,y)
global frecuencia i_amp_max g_4AP;
%% Variables de estado
V1 = y(1);
V2 = y(2);
n_4AP_1 = y(3);
n_4AP_2 = y(4);

% Parametros
g = 1e4; % g = 1/R_in, R_in = 100e6 Ohm
C = 200; % C = 20e-3*g
g_j = 2850; % g_j = 2850 pS
g_1 = g;
g_2 = g;
V_reposo = -70; % en mV
E_K = -92; % en mV

% Curvas
n_4AP_inf_1 = (1+exp(-(V1+43)/3.9))^(-1);
n_4AP_inf_2 = (1+exp(-(V2+43)/3.9))^(-1);
tau_4AP = 2;

%% Corrientes (en pA)
I_4AP_1 = g_4AP*n_4AP_1*(V1-E_K);
I_4AP_2 = g_4AP*n_4AP_2*(V2-E_K);

I_L1 = g_1*(V1-V_reposo);
I_j = g_j*(V1-V2);
I_L2 = g_1*(V2-V_reposo);

tumb = 3;
I = i_amp_max*stepfun(t,tumb)*sin(2*pi*frecuencia*(t-tumb));
% I = 0;
% I = 2*(t-tumb)*stepfun(t,tumb);
% I = 600000*stepfun(t,tumb);

%% Ecuaciones diferenciales
dydt(1) = (1/C)*(I - I_L1 - I_j - I_4AP_1);
dydt(2) = (1/C)*(I_j- I_L2 - I_4AP_2);
dydt(3) = (n_4AP_inf_1 - n_4AP_1)/tau_4AP;
dydt(4) = (n_4AP_inf_2 - n_4AP_2)/tau_4AP;
dydt = dydt';
