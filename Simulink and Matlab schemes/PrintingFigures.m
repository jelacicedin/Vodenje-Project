%% Just for printing the X vector as reference and X vector gotten from regulation

X_real = squeeze(out.x_real)';
X_ref = squeeze(out.x_ref);
t = out.tout;
% now both vectors are of the same dimensions


x_real = X_real(:,1);
y_real = X_real(:,2);
z_real = X_real(:,3);

x_ref = X_ref(:,1);
y_ref = X_ref(:,2);
z_ref = X_ref(:,3);

close all

figure

subplot(3,1,1)
hold on
plot(t,x_ref,'r');
subplot(3,1,2)
plot(t,y_ref,'r')
hold on
subplot(3,1,3)
plot(t,z_ref,'r')
hold on

subplot(3,1,1)
plot(t,x_real,'b');
title('Koordinata x','Interpreter','latex')
legend('Referen\v{c}na vrednost','Dejanska vrednost','Interpreter','latex')
xlabel('\v{C}as [s]','Interpreter','latex')
ylabel('Polo\v{z}aj [m]','Interpreter','latex')
grid on
subplot(3,1,2)
plot(t,y_real,'b')

title('Koordinata y','Interpreter','latex')
%legend('Ref. y','Res. y','Interpreter','latex')
xlabel('\v{C}as [s]','Interpreter','latex')
ylabel('Polo\v{z}aj [m]','Interpreter','latex')
grid on
subplot(3,1,3)
plot(t,z_real,'b')

title('Koordinata z','Interpreter','latex')
%legend('Ref. z','Res. z','Interpreter','latex')
xlabel('\v{C}as [s]','Interpreter','latex')
ylabel('Polo\v{z}aj [m]','Interpreter','latex')
grid on

