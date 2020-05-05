# Panda-Simulation-Control-Project
 
Osnovna navodila:

Zaženeš FrankaPanda.exe in UnityCommunicationTemplate.slx v Simulinku.
Sklepe lahko premikaš z tipkovnico ko si v Control: Keyboard, ali s Simulinkom prek UDP ko si v Control: Simulink.
Med načinoma menjaš s tipko Enter.

V Simulinku lahko vedno beremo pozicije sklepov, v Unity pa pošiljamo hitrost sklepov. Robot proti prejetim hitrostim pospešuje,
tako da upošteva omejitve pozicij sklepov in njihovih hitrosti, uporablja pa maksimalne pospeške.
(https://frankaemika.github.io/docs/control_parameters.html#denavithartenberg-parameters)