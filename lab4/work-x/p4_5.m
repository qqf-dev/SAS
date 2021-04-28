clc;
clear;

%a
b1=[1 -2];
a1=[1 1.5 0.5];

%b
[r1,p1,k1]=residue(b1,a1);

%d
b2=[3 10 5];
a2=[1 7 16 12];

%e
[r2,p2,k2]=residue(b2,a2)

%g
b3=-4;
a3=[1 0 -4];
[r3,p3,k3]=residue(b3,a3)