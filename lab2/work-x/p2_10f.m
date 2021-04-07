clc;
clear;
clf;
load lineup.mat;
y2_t=flipud(y2);
NX=length(y2);
Ryy2=conv(y2,y2_t);
plot([-NX+1:NX-1],Ryy2),title('Autp cprrelation of y2'),xlabel('n'),legend('Ryy2');
grid on;

[max1,index1]=max(Ryy2);
[max2,index2]=max(Ryy2(1:(index1-10)));
N2=index1-index2;
m=max2/max1;
