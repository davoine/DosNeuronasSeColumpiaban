%% Modelo
% 

function dydt = modelo2neuronas(t,y)

% Variables de estado
V1 = y(1);
V2 = y(2);

% Parametros
g = 1e4; % g = 1/R_in, R_in = 100e6 Ohm
C = 200; % C = 20e-3*g
g_j = 2850; % g_j = 2850 pS
g_1 = g;
g_2 = g;

% Corrientes
I_L1 = g_1*V1;
I_j = g_j*(V1-V2);
I_L2 = g_1*V2;

tumb = 5;
% I = 650*stepfun(t,tumb)*sin((t-tumb)^3);
% I = 0;
% I = 2*(t-tumb)*stepfun(t,tumb);
I = 6*stepfun(t,tumb);

% Ecuaciones diferenciales
dydt(1) = (1/C)*(I - I_L1-I_j);
dydt(2) = (1/C)*(I_j-I_L2);
dydt = dydt';   