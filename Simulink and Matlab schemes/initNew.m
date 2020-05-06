%PD regulator Values
Kp = 10;
Kd = 0.1;
load("misc\LazyFunctionQ\recorded.mat");
pts=single(pts);
accMax=[15,7.5,10,12.5,15,20,20]';
system("ControlBlock_NEW.slx");