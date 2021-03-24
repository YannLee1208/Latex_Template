clc;clear;close all;
%% Construct Discrete Signal
nx=-1:1; x=[1,1,2]; % Input Signal
nh=-1:0; h=[2,1]; % Impulse response function
%%
figure
subplot(2,1,1);
stem(nx,x);
title("x(n)");
set(gca,'xtick',min(nx):1:max(nx))
ylim([min(x)-1,max(x)+1])
xlim([min(nx)-1,max(nx)+1])
%%
subplot(2,1,2);
stem(nh,h)
title("h(n)");
set(gca,'xtick',min(nh):1:max(nh));
ylim([min(h)-1,max(h)+1])
xlim([min(nh)-1,max(nh)+1])
lx = length(x);
lh = length(h);
ly = lx+lh-1;
y = zeros(1,ly);
figure
for ii = 1:lx
      s =zeros(1,ly);
      s(ii:ii+lh-1) =x(ii)*h;      
      subplot(lx+1,1,ii);
      ns=min(nx)+min(nh):max(nx)+max(nh);
      stem(ns,s);
      set(gca,'xtick',min(nx)+min(nh):1:max(nx)+max(nh))
      xlim([min(nx)+min(nh)-1,max(nx)+max(nh)+1])
      title("x("+ii+")\timesh(n-"+ii+")");
      y=y+s;
end
subplot(lx+1,1,lx+1)
ny=min(nx)+min(nh):max(nx)+max(nh);
stem(ny,y);
title("x(n)*h(n)结果");
set(gca,'xtick',min(nx)+min(nh):1:max(nx)+max(nh))
xlim([min(nx)+min(nh)-1,max(nx)+max(nh)+1])
y1=conv(x,h);
figure;
n=min(nx)+min(nh):1:min(nx)+min(nh)+ly-1;
stem(n,y1);
xlim([min(nx)+min(nh)-1,min(nx)+min(nh)+ly])
title("x(n)*h(n)结果");

H1 = 2;
dt = 0.01;
T1 = 2;
t = -10:dt:10;
H2 = 2;
T2 = -2;
ind1 = find(t>=0 & t<=T1);
ind2 = find(t>=T2 & t<=0);
x1 = zeros(1,length(t));
x2 = zeros(1,length(t));
x1(ind1) = H1;
x2(ind2) = -H2*t(ind2);
figure
subplot(311)
plot(t,x1)
title("x1(t)");
subplot(312)
plot(t,x2)
title("x2(t)");
t2 = -20:dt:20;
y = conv(x1,x2)*dt;
subplot(313)
plot(t2,y)
xlim([-10,10])
title("y(t)=x1(t)*x2(t)");