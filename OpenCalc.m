clc
close all
clear all
close all
% Inductance
s = tf('s');
% Motor Torque Const & Electromotive force const
K = 42.9e-3
% Moment of intertia
J = 22.519e-7
% Mechanical Time Const
Tm = 3.09e-3
% Motor Viscous Friction Const
b = 2.18e-6;
% Inductance
L = 0.514e-3
% Electric Resistance
R = 2.68


global P_motor;
P_motor = K/((J*s + b)*(L*s + R) + K*K)

linearSystemAnalyzer('step', P_motor);
info = stepinfo(P_motor)
zsyz = zpk(P_motor)