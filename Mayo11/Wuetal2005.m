%% Modelo basado en Wu et al 2005
% Persistent Sodium Currents in Mesencephalic V Neurons Participate in
% Burst Generation and Control of Membrane Excitability
function [impedancia] = Wuetal2005(frec, tf, i_max,pasomax)
%% Resolucion de la ecuacion diferencial
% tfinal = 20;
global frecuencia i_amp_max;
frecuencia = frec;
i_amp_max = i_max;
tfinal = tf;
tspan = [0 tfinal];
% Condiciones iniciales
% y = [v,n,m,h]
y0 = [-59, 0.0139, 0.6568, 0.0980];

options = odeset('MaxStep',pasomax,'AbsTol', [1e-5 1e-3 1e-3 1e-3]);
[t, y] = ode45(@modeloWuetal2005,tspan,y0,options);
% [t, y] = ode45(@modeloWuetal2005, tspan, y0);

% Corrientes
v = y(:,1);
% n = y(:,2);
% h_t = y(:,3);
% h_p = y(:,4);
% 
% %% Parametros
% 
% % Potencial de Nernst
% E_K = -92;
% E_Na = 55;
% E_L = -60;
% 
% % Conductancias maximas
% g_K = 6;
% g_Na_t = 12;
% g_Na_p = 1.1;
% g_L = 2;
% 
% % Capacitancia
% C = 1;
% 
% % Curvas de activacion
% m_t_inf = 1./(1+exp(-(v+31.3)/4.3));
% h_t_inf = 1./(1+exp((v+55)/7.1));
% tau_h_t = 3;
% 
% m_p_inf =  1./(1+exp(-(v+50)/6.4));
% h_p_inf = 1./(1+exp((v+52)/14));
% tau_h_p = 1e3 + 1e4./(1+exp((v+60)/10));
% 
% I_K = g_K.*n.^4.*(v-E_K);
% I_Na_t = g_Na_t*m_t_inf.*h_t.*(v-E_Na);
% I_Na_p = g_Na_p*m_p_inf.*h_p.*(v-E_Na);
% 
% % I = 1000*(1+square((t-10)/(2*pi),20));
% tumb = 5;
% I = i_amp_max*stepfun(t,tumb).*sin(2*pi*frecuencia.*(t-tumb));
% I = 0;
% I = 2*(t-tumb)*stepfun(t,tumb);
% I = 600*stepfun(t,tumb);
% %% Figuras
% figure(1)
% plot(t,y(:,1),'k')
% hold on
% % plot(t,I,'b')
% hold off
% xlabel('tiempo (ms)')
% ylabel('voltaje (mV)')
% title('potencial de membrana V_{m}')
% 
% figure(2)
% plot(t,y(:,2),'g')
% hold on
% plot(t,y(:,3),'r')
% plot(t,y(:,4),'b')
% hold off
% xlabel('tiempo (ms)')
% ylabel('porcentaje (%)')
% legend('n','h_T','h_P')
% 
% figure(3)
% plot(t,I_K,'g')
% hold on
% plot(t,I_Na_t,'r')
% plot(t,I_Na_p,'b')
% hold off
% xlabel('tiempo (ms)')
% legend('I_K','I_{NaT}','I_{NaP}')

% Calculamos la impedancia (amplitud maxima de voltaje
% sobre amplitud maxima de corriente inyectada)
inds = find(t>(tfinal-(2/frecuencia)));
ind = inds(1);
vmax = max(v(ind:length(v)));
vmin = min(v(ind:length(v)));
v_amp_max = abs(vmax - vmin);
impedancia = v_amp_max/i_amp_max;
% 
% %% Para la FFT, solo nos importan los tiempos posteriores a la inyeccion de
% % corriente
% ind_tumbs = find(t>tumb);
% ind_tumb = min(ind_tumbs)-20; % Para no perder puntos, arrancamos desde 20 muestras
%                                                 % antes (valor de continua)
% tnuevo = t(ind_tumb:length(t)) - t(ind_tumb);
% vnuevo = v(ind_tumb:length(t));
% Inuevo = I(ind_tumb:length(t));
% 
% %% Interpolacion para hacer la FFT
% 
% tinter = [0:5e-4:tnuevo(length(tnuevo))];
% L = length(tinter); % largo del vector de tiempo
% vinter = zeros(size(tinter));
% Iinter = zeros(size(tinter));
% for k = 1:L
%     vinter(k) = interp1(tnuevo,vnuevo,tinter(k));
%     Iinter(k) = interp1(tnuevo,Inuevo,tinter(k));
% end
% 
% tinter = 1e-3*tinter; % Pasamos a ms
% %% FFTs
% Ts = tinter(2)-tinter(1);
% fs = 1/Ts;
% NFFT = 2^nextpow2(L); % L = 2^NFFT (aprox)
% f = fs/2*linspace(0,1,NFFT/2+1); % vector de frecuencia
% 
% %% Analizamos v
% V_F = fft(vinter,NFFT)/L;
% 
% %% Analizamos I
% I_F = fft(Iinter,NFFT)/L;
% 
% %% Impedancia
% H=V_F(1:NFFT/2+1)./I_F(1:NFFT/2+1); % Transferencia
% ArgH = phase(H); % fase de la transferencia
% HdB = 20*log10(abs(H));
% 
% %% Grafica 4: Modulo
% figure(4)
% semilogx(f,HdB)
% xlabel('frecuencia (Hz)')
% ylabel('|H(f)|_{dB}')
% axis tight
% grid on
% 
% %% Grafica 5: Fase
% figure(5)
% semilogx(f,ArgH)
% xlabel('frecuencia (Hz)')
% ylabel('Arg(H)')
% axis tight
% grid on
% save('data.mat')