clear;
clc;
num=4*conv([1,2],conv([1,6,6],[1,6,6]));
 den=conv([1,0],conv([1,1],conv([1,1],conv([1,1],[1,3,2,5])))); 
 sys=tf(num,den)