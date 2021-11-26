% a)
clc;close all;clear all

f_u = @(u) u; %function
dt = 1; %time step
t = [0 1]; %time interval in a)

u(1) = 1; %plot of u'(0) = u(0) = 1 starts from this point
u(2) = u(1) + dt*f_u(u(1)); %one time step forward

plot([t(1) t(2)], [u(1) u(2)],'b-',t, u,'r*')
xlabel('t');
ylabel('u(t)');

%% b)
clc;close all;clear all

f_u = @(u) u;
dt = 1;
t = [0 1 2]; %time interval in b)
u(1) = 1;


for i = 1:2
    u(i+1) = u(i) + dt*f_u(u(i));
end

plot([t(1) t(2)], [u(1) u(2)],'b-')
hold on
plot(t, u,'r*')
plot([t(2) t(3)], [u(2) u(3)],'g-')
xlabel('t');
ylabel('u(t)');
u

%% c)
clc;close all;clear all

f_u = @(u) u;
dt = 1;
t = [0 1 2 3]; %time interval in c)
u(1) = 1;


for i = 1:3
    u(i+1) = u(i) + dt*f_u(u(i));
end

plot([t(1) t(2)], [u(1) u(2)],'b-')
hold on
plot(t, u,'r*')
plot([t(2) t(3)], [u(2) u(3)],'g-')
plot([t(3) t(4)], [u(3) u(4)],'k-')
u
xlabel('t');
ylabel('u(t)');

%% d)
clear all;close all;clc

f_u = @(u) u;
dt = 1;
t = [0 1 2 3];
u(1) = 1;

u_exact = @(t) exp(t); %equation that fulfills u' = u

for i = 1:3
    u(i+1) = u(i) + dt*f_u(u(i));
end

hold on
u

time = linspace(0, 3, 100);
u_true = u_exact(time);
plot(time, u_true, 'b-', t, u, 'r*');
xlabel('t');
ylabel('u(t)');

%%%%%%%%%%%%%%%%%%%%
% COMMENT OUT IF NEEDED, straight line plots below

% hold on
% plot([t(1) t(2)], [u(1) u(2)],'b-')
% plot(t, u,'r*')
% plot([t(2) t(3)], [u(2) u(3)],'g-')
% plot([t(3) t(4)], [u(3) u(4)],'k-')
