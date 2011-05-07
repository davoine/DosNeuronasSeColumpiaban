clear all
close all
clc
n = 1;
for k = 1:2:9
    imp(n)=Liuetal2008again(k/1000,5000,10,1e-1);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 10:20:90
    imp(n)=Liuetal2008again(k/1000,1000,10,1e-2);
    frecuencias(n) = k/1000;
    n = n + 1
end

for k = 100:100:600
    imp(n)=Liuetal2008again(k/1000,300,10,1e-3);
    frecuencias(n) = k/1000;
    n = n + 1
end

frecuencias = frecuencias*1e3; % pasamos a Hz
figure(5)
semilogx(frecuencias, imp);
ylabel('Impedancia (xx \Omega)')
xlabel('frecuencia (Hz)')
axis tight