clear all
close all
clc
n = 1;
m = 1;
g4AP = 5e5;
for k = 1:1:10
    transferencia(n)=modelo2neuronas4AP(k,50,4e6,1e-2,g4AP);
    frecuencias(n) = k;
    n = n + 1
end

for k = 10:5:100
    transferencia(n)=modelo2neuronas4AP(k,12,4e6,1e-3,g4AP);
    frecuencias(n) = k;
    n = n + 1
end

for k = 100:50:1000
    transferencia(n)=modelo2neuronas4AP(k,8,4e6,1e-4,g4AP);
    frecuencias(n) = k;
    n = n + 1
end

frecuencias = frecuencias;

figure(5)
semilogx(frecuencias,transferencia);
