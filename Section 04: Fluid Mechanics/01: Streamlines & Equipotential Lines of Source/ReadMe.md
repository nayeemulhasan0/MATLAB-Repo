# Stream Function and Velocity Potential of a Source
![image](https://github.com/user-attachments/assets/adf77563-8f27-47d1-9516-5fe71842809a)



This document demonstrates how to visualize the stream function (`\psi`) and velocity potential (`\phi`) of a two-dimensional flow field using MATLAB. Additionally, the flow direction is illustrated with quiver plots.

---



## Define the Computational Grid
```matlab
[x, y] = meshgrid(linspace(-5, 5));
```
- The grid is defined over the range \([-5, 5]\) in both `x` and `y` directions.

---

## Calculate Polar Coordinates
```matlab
r = sqrt(x.^2 + y.^2);
theta = atan2(y, x);
```
- `r`: Radial distance.
- `theta`: Angular position.

---

## Define Flow Properties
```matlab
phi = 2 * log(r);
psi = 2 * theta;
```
- **Velocity potential**: \( \phi = 2 \ln(r) \).
- **Stream function**: \( \psi = 2 \theta \).

---

## Compute Velocity Components
```matlab
[u, v] = gradient(phi);
```
- The gradient of \( \phi \) is used to calculate velocity components \( u \) and \( v \).

---

## Plot the Results
```matlab
contour(x, y, phi, 20, "b--"); hold on;
contour(x, y, psi, 20, "r");
quiver(x, y, u, v, AutoScale="off");
legend("phi", "psi", "flow direction");
axis equal;
```


- Blue dashed lines represent the velocity potential \( \phi \).
- Red solid lines represent the stream function \( \psi \).
- Flow direction vectors are overlaid with the `quiver` function.

![image](https://github.com/user-attachments/assets/b69681f0-ca03-4acd-94c8-31663c1b4717)

---

## Author

 [@NayeemulHasan](https://www.github.com/nayeemulhasan0)
