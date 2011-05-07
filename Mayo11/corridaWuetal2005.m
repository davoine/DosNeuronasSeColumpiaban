clear all
close all
clc
n = 1;
for k = 1:0.5:10
    imp(n)=Wuetal2005(k/1000,10000,10,1e-1);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 10:5:100
    imp(n)=Wuetal2005(k/1000,1000,10,1e-2);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 100:50:1000
    imp(n)=Wuetal2005(k/1000,100,10,1e-3);
    frecuencias(n) = k/1000;
    n = n + 1
end

frecuencias = frecuencias*1e3; % pasamos a Hz
figure(5)
semilogx(frecuencias, imp);
ylabel('Impedancia (xx \Omega)')
xlabel('frecuencia (Hz)')
axis tight