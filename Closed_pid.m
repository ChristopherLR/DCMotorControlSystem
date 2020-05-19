close all


Kp = 0.5;
Ki = 150;
Kd = 0.005;

Pc1 = pid(Kp);
Pc2 = pid(Kp, Ki, Kd, 100);

Pp_motor = feedback(P_motor*Pc1, 1);

info = stepinfo(Pp_motor)

Ppid_motor = feedback(P_motor*Pc2, 1);

info = stepinfo(Ppid_motor)

zinfo = zpk(P_motor*Pc2)

%linearSystemAnalyzer('step', Pp_motor);

linearSystemAnalyzer('step', Ppid_motor);

