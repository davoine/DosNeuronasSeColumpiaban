clear all
clc
tau = 1/333.3;
C = 82.4e-12;

s = 0.6448;
G = 7.65e-4;
wn = 290.7;
gj = 1/197.4e6;
gL = 1/153.1e6;

k = 3.9e-3;
Vmedio = -43e-3;
V2 = -55.1e-3;

n4AP = 1/(1+exp(-(V2-Vmedio)/k));
dn4APdV = ((n4AP^2)*exp(-(V2-Vmedio)/k))/k;

EK = -92e-3;

g4AP = (tau*C*wn^2-gL-gj)/(n4AP+(V2-EK)*dn4APdV)
beta = gj+gL+g4AP*n4AP;
amortiguamiento = (beta*tau +C)/(tau*C)