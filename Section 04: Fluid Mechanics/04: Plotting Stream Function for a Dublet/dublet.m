clear all;

%let
mu=1;

syms x y
F(x,y)=mu./(x+1i*y)
stream_function=imag(F)

[X,Y]=meshgrid(linspace(-2,2,100));
psi=imag(F(X,Y));

contour(X,Y,psi,40)
axis equal

