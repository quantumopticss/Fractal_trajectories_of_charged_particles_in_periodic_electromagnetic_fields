function rt() % in this section we will slove \mathbf{r}(t) through analysis methods
%% users set
q = 1;
m = 1;
w = 1; % \omega
E = 1; % we set E = 1; because it only influence the eigen lenth instead of the frcatal figure;
B = 1;
gamma = q/m;  
lambda = gamma*B/w;  
% there are three eigen number
% core1 = w
% core2 = lambda
% core3 = gamma*E/(L*w^2) where L is eigen size
dt = 0.0005;  % time accuracy

%% cal v(t)
tt = 0:dt:2*pi/w+dt; % tlist of the first period
[~,c] = size(tt);

Vlist=zeros(2,c);
a = cos(lambda*cos(w*tt));
b = sin(lambda*cos(w*tt));
J1 = @(tt) cos(w*tt).*cos(lambda*cos(w*tt));  %%% x
J2 = @(tt) cos(w*tt).*sin(lambda*cos(w*tt));  %%% y

for k = 2:c
    Vlist(1,k)=a(1,k)*integral(J1,0,tt(1,k))+b(1,k)*integral(J2,0,tt(1,k));   %Vx
    Vlist(2,k)=-a(1,k)*integral(J2,0,tt(1,k))+b(1,k)*integral(J1,0,tt(1,k));  %Vy
end
%%Vlist = Vlist*gamma;  % it will only influence the lenth of the phase figure

%% cal r(t)
rlist = zeros(2,c-1); % x;y
for k = 2:c-1
    rlist(:,k) = rlist(:,k-1) + (Vlist(:,k+1)+Vlist(:,k))*dt/2; %% RK2
end


m = 10;  %% which means you want to know the trajectory in the time [0,(m+1)T];
xlist = zeros(1+m,k);
ylist = xlist;
xlist(1,:) = rlist(1,:);
ylist(1,:) = rlist(2,:);

f_x = @(t) sin(lambda*cos(w*t));
f_y = @(t) cos(lambda*cos(w*t));

Int_x = zeros(1,c-1);
Int_y = Int_x;

for i = 1:c-1
    Int_x(1,i) = integral(f_x,0,tt(1,i)); 
    Int_y(1,i) = integral(f_y,0,tt(1,i));
end

for i = 2:1+m
    xlist(i,:) = xlist(1,:) + 2*pi*gamma*E*besselj(1,lambda)*(i-1)*Int_x(1,:)/w;
    ylist(i,:) = ylist(1,:) - 2*pi*gamma*E*besselj(1,lambda)*(i-1)*Int_y(1,:)/w - 2*(i-1)^2*pi^2*gamma*E*besselj(1,lambda)*besselj(0,lambda)/w^2;
end

X = xlist(1,:);
Y = ylist(1,:);
for i = 2:1+m
    X = cat(2,X,xlist(i,:));
    Y = cat(2,Y,ylist(i,:));
end

%% fig
scatter(X,Y,1);
