clear all
close all
clc

g4AParray = [0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9]; % en pS
for w = 1:length(g4AParray)
n = 1;
<<<<<<< HEAD
m = 1;

g4AP = 1e7;
=======
g4AP = g4AParray(w);
I_iny = 5e5; % en pA
>>>>>>> 2c9e60a456db8215a4433d3aecf2f163b91d499c
for k = 1:1:10
    transferencia(w,n)=modelo2neuronas4AP(k,50,I_iny,1e-2,g4AP);
    frecuencias(w,n) = k;
    n = n + 1
end

for k = 10:5:100
    transferencia(w,n)=modelo2neuronas4AP(k,12,I_iny,1e-3,g4AP);
    frecuencias(w,n) = k;
    n = n + 1
end

for k = 100:50:1000
    transferencia(w,n)=modelo2neuronas4AP(k,8,I_iny,1e-4,g4AP);
    frecuencias(w,n) = k;
    n = n + 1
end

<<<<<<< HEAD
figure(5)
xlabel('frecuencia (Hz)')
semilogx(frecuencias,transferencia)
=======
end
% figure(5)
% semilogx(frecuencias,transferencia);

save

>>>>>>> 2c9e60a456db8215a4433d3aecf2f163b91d499c
