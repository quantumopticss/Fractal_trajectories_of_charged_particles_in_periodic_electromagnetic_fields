function slove_V()
%% users set
q =1;
m= 1;
w= 1;    %core 1
%E = 1; %%% we set E = 1; because it only influence the eigen lenth instead of the frcatal figure;
B = 13.3236919363142; %lambda = gamma*B/w -> B
gamma = q/m;  
lambda = gamma*B/w;  %core2
% core3 = gamma*E/(L*w^2);

tt = 0.01:0.01:16;
[~,c] = size(tt);

Vlist=zeros(1,c);
a = cos(lambda*cos(w*tt));
b = sin(lambda*cos(w*tt));
J1 = @(tt) cos(w*tt).*cos(lambda*cos(w*tt));  %%% x
J2 = @(tt) cos(w*tt).*sin(lambda*cos(w*tt));  %%% y

%% cal v(t)
for k = 1:c
    Vlist(1,k)=a(1,k)*integral(J1,0,tt(1,k))+b(1,k)*integral(J2,0,tt(1,k));   %Vx
    Vlist(2,k)=-a(1,k)*integral(J2,0,tt(1,k))+b(1,k)*integral(J1,0,tt(1,k));  %Vy
end
%%Vlist = Vlist*gamma;  % it will only influence the lenth of the phase figure

hold on;
%plot(tt,Vlist(1,:));
%scatter(tt,tt.*sin(lambda)*besselj(1,lambda))
%%%phase V
plot(Vlist(1,:),Vlist(2,:)); 