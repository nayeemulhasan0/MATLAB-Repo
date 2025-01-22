clear;clc;

[x,y]=meshgrid(linspace(-5,5));

r=sqrt(x.^2+y.^2);
theta=atan2(y,x);

phi=2*log(r);
psi=2*theta;

[u,v]=gradient(phi);

%ploting

contour(x,y,phi,20,"b--"); hold on;
contour(x,y,psi,20,"r")
quiver(x,y,u,v,AutoScale="off")
legend("phi","psi","flow direction")
axis equal


