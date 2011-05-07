%% Modelo
% Funcion con las ecuaciones diferenciales
function dydt = modeloWuetal2005(t,y)
global frecuencia i_amp_max;
% definimos:
% y(1) = V
% y(2) = n
% y(3) = h_t
% y(4) = h_p
V = y(1);
n = y(2);
h_t = y(3);
h_p = y(4);

%% Parametros
% Potencial de Nernst
E_K = -92;
E_Na = 55;
E_L = -60;

% Conductancias maximas
g_K = 6;
g_Na_t = 12;
g_Na_p = 1.1;
g_L = 2;

% Capacitancia
C = 1;


% Curvas de activacion e inactivacion
tau_n = 4;
n_inf = 1/(1+exp(-(V+43)/3.9)); % Nota: esta es la misma expresion que usan en Liu2008 para la corriente sensitiva a 4-AP

m_t_inf = 1/(1+exp(-(V+31.3)/4.3));
h_t_inf = 1/(1+exp((V+55)/7.1));
tau_h_t = 3;

m_p_inf =  1/(1+exp(-(V+50)/6.4));
h_p_inf = 1/(1+exp((V+52)/14));
tau_h_p = 1e3 + 1e4/(1+exp((V+60)/10));

% Corrientes
I_K = g_K*n*(V-E_K);
I_Na_t = g_Na_t*m_t_inf*h_t*(V-E_Na);
I_Na_p = g_Na_p*m_p_inf*h_p*(V-E_Na);
I_L = g_L*(V-E_L);

% I = 1000*(1+square((t-10)/(2*pi),20));
tumb = 5;
I = i_amp_max*stepfun(t,tumb)*sin(2*pi*frecuencia*(t-tumb));
% I = 0;
% I = 2*(t-tumb)*stepfun(t,tumb);
% I = 600*stepfun(t,tumb);

%% Ecuaciones diferenciales
dydt(1) = (1/C)*(I-I_K-I_Na_t-I_Na_p-I_L);
dydt(2) = (n_inf-n)/tau_n;
dydt(3) = (h_t_inf-h_t)/tau_h_t;
dydt(4) = (h_p_inf-h_p)/tau_h_p;
dydt = dydt';