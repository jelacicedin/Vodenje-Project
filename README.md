# Vodenje-Project
 
VODENJE ROBOTOV projekt Franka Emika Panda

Za vizualizacijo si najprej poženete Vodenje-Project/Unity Built NEWER/FrankaPanda.exe. Kontrole so vidne v ozadju sobe, menjate pa med keyboard in simulink control načinoma, drugi mora biti prižgan da program prejema q_dot vektor od Simulink shem. q vektor pošilja simulinku ne glede na izbran control mode.

Glavno simulink shemo odprete tako, da poženete Vodenje-Project/Simulink and Matlab schemes/initNew.m, gre pa za ControlBlock_NEWER.slx. V shemi imate dashboard gumb kjer menjate med tremi načini delovanja, za sekvenčno izvajanje gibov uporabite zadnjega.
Za snemanje novih točk odprete Vodenje-Project/Simulink and Matlab schemes/misc/LazyFunctionQ/recordMotion.slx, poženete shemo in v Unity programu s tipkovnico premikate robota. Ko želite posneti točko, pustite robota stati vsaj 3s. Ko posnamete, ustavite simulink shemo in poženete lazyFunction.m funkcijo, ki bo ustvarila .mat datoteko, ki se naloži v glavno shemo ko poženemo initNew.m. Potrebno je še popraviti variable size v stateflow chartu za spremenljivko pts, tako da je dimenzij nx7, kjer je n število posnetih točk.


Za operacijsko interpolacijo, poženete Vodenje-Project/Operational Interpolation/letterN.mat, in potem zaženete model InterpolationIkinePD2019.slx.