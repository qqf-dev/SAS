

clear;
clc;

m=-9.109e-31;
q=1.6e-19;
B=1;
g=[0 -9.8];
G=m.*g;

v0 = [0 0];

F = G;

dt = 0.0001;
tmax = 1;
t = 0:dt:tmax;


x = zeros(length(t)+1);
y = x;

x(1) = 0;
y(1) = 0;

for li = 1:length(t)

a = F ./ m;

vt = v0 + a.*dt;

x(li+1) = x(li) + vt(1) * dt;
y(li+1) = y(li) + vt(2) * dt;

vn ===


Fl = q .* B .* vn./sqrt((vn(1))^2+(vn(2))^2) .* sqrt((vt(1))^2+(vt(2))^2);

F = G + Fl;
v0 = vt;
end

plot(x,y);
