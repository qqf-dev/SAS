clc;
clear;
clf;
load lineup.mat;

figure(1);
X=[0:1000];
B=[1 zeros(1,999) 0.5];
A=[1];
x1=[1 zeros(1,1000)];
he=filter(B,A,x1);
stem(X,he);

figure(2);
B=[1];
A=[1 zeros(1,999) 0.5];
z=filter(B,A,he);
stem(X,z);

figure(3);
X3=[0:4000];
d=[1 zeros(1,4000)];
A=[1 zeros(1,999) 0.5];
B=[1];
her=filter(B,A,d);
stem(X3,her);

figure(4);
z=filter(B,A,y);
sound(z,8192);
plot(z);

figure(5);
hoa=conv(he,her);
stem(hoa);
grid on;
%截断效应

figure(6);
y2_t=flipud(y2);
NX=length(y2);
Ryy2=conv(y2,y2_t);
plot([-NX+1:NX-1],Ryy2),title('Autp cprrelation of y2'),xlabel('n'),legend('Ryy2');
grid on;

[max1,index1]=max(Ryy2);
[max2,index2]=max(Ryy2(1:(index1-10)));
N2=index1-index2;
Rxx=conv(z,flipud(z));
plot(Rxx);
[max_x,indexx]=max(Rxx);
a2=max2/Rxx(indexx+501)
B=[1 zeros(1,N2-1) a2];
y2_p=filter(B,1,x);
figure(7);
stem(y2),hold on,stem(y2_p);
