clc; clear;
n = 100; %number of data points
%X = normrnd(10,5,[2 n]);
X(1,:) = linspace(0,20,100);
X(2,:) = linspace (0,20,100);
[~,z] = size(X);
for ii = 1:1:z
Y(ii) = X(1,ii)^3+X(2,ii)^3-18; %calculate actual Y values
end
net1 = feedforwardnet(20); %generate neural network
net1 = train(net1,X,Y);
xx(1,:) = linspace(0,20,100);
xx(2,:) = linspace (0,20,100);
yy = sim(net1,xx); %simulate Y values from neural network
plot3(X(1,:),X(2,:),Y,'x',xx(1,:),xx(2,:),yy); %3D plot
err = mse(yy,Y); %Calculate Mean Square errror
%%conduct MCS using given mean and standard deviation to find pf
N = 100000; % number of iterations
x = normrnd(10,5,[2 N]); %generate random variables
y = sim(net1,x);%simulate data points from trained neural network
nf = sum(y < 0); %sum number of data points where g() < 0
pf = nf/N;%calculate probability of failure
 






