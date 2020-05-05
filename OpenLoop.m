clc
close all
clear all
% Inductance
s = tf('s');
% Motor Torque Const & Electromotive force const
K = 0.01;
% Motor Viscous Friction Const
b = 0.1;
% Inductance
L = 5;
% Electric Resistance
R = 1;
% Moment of intertia
J = 0.01;

P_motor = K/((J*s + b)*(L*s + R) + K*K)

step(P_motor)

info = stepinfo(P_motor)

control = pid(999,1,1,100)

figure(2)
step(feedback(P_motor*control,1))