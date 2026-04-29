clc; clear;
n = 10000; %number of updates for w
a = 0.9; %learning rate
w = [1 1 1]'; %Initialize w, x values and y values
X1 = [0 0 1]';
X2 = [0 1 1]';
X3 = [1 0 1]';
X4 = [1 1 1]';
Y = [0 1 1 0]';
for ii = 1:1:n
%first data point
z = w'*X1;
[Fz,dz] = f(z);
d = delta(Fz,Y(1));
%update weight values
w = w+a*d*X1;

%second data point
z = w'*X2;
[Fz,dz] = f(z);
d = delta(Fz,Y(2));
w = w+a*d*X2;

%third data point
z = w'*X3;
[Fz,dz] = f(z);
d = delta(Fz,Y(3));
w = w+a*d*X3;

%fourth point
z = w'*X4;
[Fz,dz] = f(z);
d = delta(Fz,Y(4));
w = w+a*d*X4;
end

%Calculate Y values
Y1 = f(w'*X1);
Y2 = f(w'*X2);
Y3 = f(w'*X3);
Y4 = f(w'*X4); 
%functions to calculate sigmoid and derivative of sigmoid function
function [Fz,dz] = f(z)
Fz = 1/(1+exp(-z));
dz = Fz*(1-Fz);
end
%function to calculate calculate delta value
function answer = delta(Fz,y)
answer = (y-Fz)*(Fz)*(1-Fz);
end
