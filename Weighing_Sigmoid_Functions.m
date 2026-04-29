clc; clear;
a = 0.9; %define alpha value
n = 10000; %define numebr of iterations
W1 = [1 1 1 ; 1 1 1; 1 1 1; 1 1 1]; %intialize weight values of first layer
W2 = [1 1 1 1]; %intialize weight values of second layer
X1 = [0 0 1]'; %initialize data point
X2 = [0 1 1]';
X3 = [1 0 1]';
X4 = [1 1 1]';
Y = [0 1 1 0];
for ii = 1:1:n
%for first data point
Z1 = W1*X1; %calculate first layer
Fz1 = f(Z1);
Z2 = W2*f(Z1); %calculate second layer
Fz2 = f(Z2); %determine final output value
d2 = delta(Fz2,Y(1));
W2 = W2+a*d2*Fz1'; %update weight of second layer
d1 = delta_2(Fz1,d2,W2');
W1 = W1+a*d1*X1'; %update weight of first layer
%for second data point
Z1 = W1*X2; %calculate first layer
Fz1 = f(Z1);
Z2 = W2*f(Z1); %calculate second layer
Fz2 = f(Z2); %determine final output value
d2 = delta(Fz2,Y(2));
W2 = W2+a*d2*Fz1'; %update weight of second layer
d1 = delta_2(Fz1,d2,W2');
W1 = W1+a*d1*X2';
%for third data point
Z1 = W1*X3; %calculate first layer
Fz1 = f(Z1);
Z2 = W2*f(Z1); %calculate second layer
Fz2 = f(Z2); %determine final output value
d2 = delta(Fz2,Y(3));
W2 = W2+a*d2*Fz1'; %update weight of second layer
d1 = delta_2(Fz1,d2,W2');
W1 = W1+a*d1*X3';
%for fourth data point
Z1 = W1*X4; %calculate first layer
Fz1 = f(Z1);
Z2 = W2*f(Z1); %calculate second layer
Fz2 = f(Z2); %determine final output value
d2 = delta(Fz2,Y(4));
W2 = W2+a*d2*Fz1'; %update weight of second layer
d1 = delta_2(Fz1,d2,W2');
W1 = W1+a*d1*X4'; %update weight of first layer
end
%Calculate Y values:
Y1 = f(W2*f(W1*X1));
Y2 = f(W2*f(W1*X2));
Y3 = f(W2*f(W1*X3));
Y4 = f(W2*f(W1*X4));

%functions to calculate sigmoid and derivative of sigmoid function
function [Fz,dz] = f(z)
Fz = 1./(1+exp(-z));
dz = Fz.*(1-Fz);
end
%function to calculate delta for first layer
function answer = delta(Fz,y)
answer = (y-Fz)*(Fz)*(1-Fz);
end
%function to find delta for second layer
function answer = delta_2(Fz,delta,W) 
answer = Fz.*(1-Fz).*W.*delta;
end