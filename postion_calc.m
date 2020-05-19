close all


Pp = 0.5;
Pi = 0;
Pd = 0;

Posc1 = pid(Kp);
Posc2 = pid(Kp, Ki, Kd, 100);

Pcp_motor = feedback(P_motor*Posc1*(1/s), 1);

info = stepinfo(Pp_motor)

Pcpid_motor = feedback(P_motor*Posc2*(1/s), 1);

info = stepinfo(Pcpid_motor)

%linearSystemAnalyzer('step', Pp_motor);

linearSystemAnalyzer('step', Pcp_motor);

