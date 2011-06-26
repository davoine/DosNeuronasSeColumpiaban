function V_0 = nullclineV1V2(V)
global g_L C g_NaP g_4AP E_L E_Na E_K I g_j
V1 = V(1);
V2 = V(2);
n_4AP_inf_1 = (1+exp(-(V1+43)/3.9))^(-1);
n_NaP_inf_1 = (1+exp(-(V1+50)/6.4))^(-1);
n_4AP_inf_2 = (1+exp(-(V2+43)/3.9))^(-1);
n_NaP_inf_2 = (1+exp(-(V2+50)/6.4))^(-1);
V_01 = I - g_j*(V1-V2)- g_L*(V1-E_L)-g_4AP*n_4AP_inf_1*(V1-E_K)-g_NaP*n_4AP_inf_1*(V1-E_Na);
V_02 = g_j*(V1-V2)- g_L*(V2-E_L)-g_4AP*n_4AP_inf_2*(V2-E_K)-g_NaP*n_4AP_inf_2*(V2-E_Na);
V_0 = [V_01 V_02];
end