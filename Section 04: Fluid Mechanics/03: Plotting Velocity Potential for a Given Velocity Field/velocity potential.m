clear;clc

[X Y]=meshgrid(linspace(-5,5,100));

syms x y u(x,y) v(x,y) phi(x,y) psi(x,y)
u(x,y)=2*(x.^2-y.^2)
v(x,y)=-4.*x*y

phi(x,y)=int(u,x)+int(v,y)
psi(x,y)=int(u,y)-int(v,x)

figure;
contourf(X,Y,phi(X,Y),50);
hold on;
quiver(X,Y,u(X,Y),v(X,Y))
title("velocity potential");
axis equal


