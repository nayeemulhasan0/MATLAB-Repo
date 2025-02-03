clear all;

F = @(z)  z^(-1);

[x, y] = meshgrid(linspace(-5, 5, 100));
psi = imag(F(x + 1i*y));

contour(x, y, psi, 50);
axis equal;
