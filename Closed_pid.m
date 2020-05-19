
Kp = 1;
Ki = 1;
Kd = 1;

Pc1 = pid(Kp);
Pc2 = pid(Kp, Ki, Kd, 100);

Pp_motor = feedback(P_motor*Pc1, 1);

info = stepinfo(Pp_motor)

Ppid_motor = feedback(P_motor*Pc2, 1);

info = stepinfo(Ppid_motor)

linearSystemAnalyzer('step', Pp_motor);

linearSystemAnalyzer('step', Ppid_motor);

