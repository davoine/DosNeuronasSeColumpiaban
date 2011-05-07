clear all
close all
clc
n = 1;
m = 1;

for k = 1:2:10
    transferencia(n)=modelo2neuronas4AP(k/1000,8000,40000,1e-1,0);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 10:20:100
    transferencia(n)=modelo2neuronas4AP(k/1000,4000,40000,1e-2,0);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 100:100:600
    transferencia(n)=modelo2neuronas4AP(k/1000,600,40000,1e-3,0);
    frecuencias(n) = k/1000;
    n = n + 1
end

frecuencias = frecuencias*1e3;

figure(5)
semilogx(frecuencias,transferencia);
save('data.mat')