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
b = 2.18e-6
% Inductance
L = 0.514e-3
% Electric Resistance
R = 2.68

P_motor = K/((J*s + b)*(L*s + R) + K*K)

Kp = 0.003792; %9.0982656
%Kp = 9.0982/24;
Ki = 5.299; %15721.80295
%Ki = 15721.8/24;
Kd = 6.782e-07; %0.0013163
%Kd = 0.00131/24;
Pc1 = pid(1);
Pc2 = pid(Kp, Ki, Kd, 100);

sat = saturation([0 1])

Pp_motor = feedback(P_motor*Pc1, 1);

info = stepinfo(Pp_motor)

Ppid_motor = feedback(P_motor*Pc2, 1);

info = stepinfo(Ppid_motor)

%zinfo = zpk(P_motor*Pc2)

linearSystemAnalyzer('step', Pp_motor);

%linearSystemAnalyzer('step', Ppid_motor);

