clear all
clc
tau = 2.3e-3;
C = 34e-12;

wn = 526.7;
s = 0.5848;
G = 1.126e-4;
gj = 1940e-12;
gL = 9124e-12;

k = 3.9e-3;
Vmedio = -43e-3;
V2 = -39.7e-3;

n4AP = 1/(1+exp(-(V2-Vmedio)/k));
dn4APdV = ((n4AP^2)*exp(-(V2-Vmedio)/k))/k;

EK = -92e-3;

g4AP = (tau*C*wn^2-gL-gj)/(n4AP+(V2-EK)*dn4APdV)
beta = gj+gL+g4AP*n4AP;
amortiguamiento = (beta*tau +C)/(tau*C)