function V_0 = nullclineV(V)
global g_L C g_NaP g_4AP E_L E_Na E_K I
n_4AP_inf = (1+exp(-(V+43)/3.9))^(-1);
n_NaP_inf = (1+exp(-(V+50)/6.4))^(-1);
V_0 = I - g_L*(V-E_L)-g_4AP*n_4AP_inf*(V-E_K)-g_NaP*n_4AP_inf*(V-E_Na);
end