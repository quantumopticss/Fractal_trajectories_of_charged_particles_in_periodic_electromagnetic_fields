function fun = group_ode(t,x)

%clist = [1,1,1,1,1,2.40482555769577];
E = 1;%clist(1,1);
q = 1;%cLlist(1,2);
m = 1;%c
w = 1;%
B = 1;
% lambda = q*B/(m*w);  %core2
Ae = q*E*cos(w*t)/m;
Be = q*B*sin(w*t)/m;

fun=[x(2);Ae+Be*x(4);x(4);-Be*x(2)];
