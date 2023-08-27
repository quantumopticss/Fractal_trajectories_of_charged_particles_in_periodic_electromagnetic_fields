function group_ode_slove()
clc;
clear;
close all;

tspan=[0,2*pi*11];  %%space of time;
x0 = [0,0,0,0]; %initial x;
[t,x] = ode89('group_ode',tspan,x0);  %%%% if you want to know the relationship of x(t) or y(t) use [t,x]!!!!

figure;
hold on;
plot(x(:,1),x(:,3),'r'); %print -deps plot_state-3         %+    
%%%% use plot(t,x(:,1)) or plot(t,x(:,3)) to visual x(t) or y(t)

%plot(x(:,2),x(:,4));       %-

%plot(t,x(:,3),'b');
%plot(t,x(:,4));
%xlabel('x');
%ylabel('y');
legend('r(t)');
