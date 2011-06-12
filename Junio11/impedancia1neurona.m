%% Calculo de impedancia teorica de una neurona
clear all
close all
clc

global g_L C g_NaP g_4AP E_L E_Na E_K I

% Parametros
% g = 1e4; % g = 1/R_in, R_in = 100e6 Ohm
% C = 200; % C = 20e-3*g = 200 pF
% g_j = 2850; % g_j = 2850 pS

% f = [0:1:10,20:10:100,200:100:1000];
f = [0:0.1:10,11:1:100,110:10:1000];
w = 2*pi*f;

I = 1000;

% g_4APs = [0:10:100, 200:100:5e4];
g_4APs = [1480:0.1:1500];

for cont = 1:length(g_4APs)

g_4AP = g_4APs(cont);
g_L = 1000;
C = 20;
g_NaP = 0;
g_1 = g_L;
g_2 = g_L;
E_L = -55; % en mV
E_Na = 50;
E_K = -90; % en mV

V0 = fzero(@nullclineV,-55);
n_4AP0 = (1+exp(-(V0+43)/3.9))^(-1);

V_eq(cont) = V0;

% Curvas
n_4AP_inf = (1+exp(-(V0+43)/3.9))^(-1);
dn_4AP_inf = (1/3.9)*n_4AP_inf^2*exp(-(V0+43)/3.9);
tau_4AP = 2;

n_NaP_inf = (1+exp(-(V0+50)/6.4))^(-1);
dn_NaP_inf = (1/6.4)*n_NaP_inf^2*exp(-(V0+50)/6.4);

G = i*w*C + g_L + g_4AP*n_4AP0 + g_NaP*n_NaP_inf + g_NaP*(V0-E_Na)*dn_NaP_inf + g_4AP*(V0-E_K)*dn_4AP_inf./(1+i*w*tau_4AP);

Z(cont,:) = 1./G;
modZ(cont,:) = abs(Z(cont,:));

end

figure(1)
surf(f,V_eq, modZ)
set(gca,'xscale','log')
set(gca,'zscale','log')
xlabel('frecuencia (Hz)')
ylabel('voltaje (mV)')
title('Impedancia de una neurona')