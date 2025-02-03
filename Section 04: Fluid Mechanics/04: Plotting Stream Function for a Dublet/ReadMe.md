# Stream Function Visualization of a Dublet

![image](https://github.com/user-attachments/assets/742f403d-378d-4e5f-bad9-2848e1b86be9)


## Overview
This MATLAB script visualizes a stream function for a complex-valued function using contour plotting.

## Prerequisites
- MATLAB with Symbolic Math Toolbox
- Basic understanding of complex analysis

## Code Explanation

### Parameters
- `mu`: Parameter controlling the function's behavior (set to 1 in this script)
- `x`, `y`: Symbolic variables representing complex plane coordinates

### Function Definition
```matlab
F(x,y) = mu / (x + 1i*y)
```
- Creates a complex-valued function `F`
- Uses the imaginary unit `1i`

### Stream Function Calculation
```matlab
stream_function = imag(F)
```
- Extracts the imaginary part of `F`
- Represents the stream function in the complex plane

### Visualization
```matlab
[X,Y] = meshgrid(linspace(-2,2,100))
psi = imag(F(X,Y))
contour(X,Y,psi,40)
axis equal
```
- Creates a 100x100 grid from -2 to 2 in both x and y directions
- Calculates stream function values
- Plots 40 contour lines
- Sets equal aspect ratio for x and y axes

![image](https://github.com/user-attachments/assets/74b755d6-9cb4-4468-8005-5b4915bc5673)


## Notes
- Adjust `mu` to explore different flow patterns
- Modify grid parameters for different resolution


## Author

 [@NayeemulHasan](https://www.github.com/nayeemulhasan0)


