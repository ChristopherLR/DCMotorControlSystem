clc
clear variables

t = 0:0.0001:0.1;

J = (21.2+1.3)*10^-7;
b = 7.3*10^-4;
K = 42.9*10^-3;
R = 2.68;
L = 0.514*10^-3;

s = tf('s');

P_motor = K/((J*s + b)*(L*s + R) + K^2);

figure(1)
step(P_motor)

C_speed = pid(0.5, 300, 0.00005);
%C_speed = pid(0.2);

speed_forward = C_speed * P_motor;

speed_ctl = feedback(speed_forward, 1);
figure(2)
step(speed_ctl)
stp_info_1 = stepinfo(speed_ctl)

%pid without consideration of voltage constraint
%C_pos = pid(50, 150, 0.06);
C_pos = pid(0.5);

pos_forward = C_pos * P_motor / s;

pos_ctl = feedback(pos_forward, 1);
figure(3)
step(pos_ctl)
stp_info_2 = stepinfo(pos_ctl)