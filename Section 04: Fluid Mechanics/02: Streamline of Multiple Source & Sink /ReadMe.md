# Velocity Field and Streamline Circle

![image](https://github.com/user-attachments/assets/71716765-89fe-4daa-84e4-9e868c33eb3b)


This markdown file documents the MATLAB script used to generate the velocity field of a flow induced by two sources and two sinks, as well as to overlay a streamline circle.

## Overview
The script calculates the velocity components (U, V) induced by:
- Two sources at specific positions.
- Two sinks at specific positions.

The results are visualized using a quiver plot to represent the velocity field and a circle to illustrate a streamline.

---

## Code Breakdown

### Initialization
```matlab
clear; clc;

source = [3 0; -3 0]; % Coordinates of the sources
sink = [0 3; 0 -3];   % Coordinates of the sinks
st = 1;               % Strength of the sources/sinks
```
This section initializes the source and sink positions along with their strengths.

### Grid and Velocity Components
```matlab
[X, Y] = meshgrid(linspace(-5, 5, 100));

U = (st / (2 * pi)) .* ((X - source(1, 1)) ./ ((X - source(1, 1)).^2 + (Y - source(1, 2)).^2) + ...
                        (X - source(2, 1)) ./ ((X - source(2, 1)).^2 + (Y - source(2, 2)).^2) - ...
                        (X - sink(1, 1)) ./ ((X - sink(1, 1)).^2 + (Y - sink(1, 2)).^2) - ...
                        (X - sink(2, 1)) ./ ((X - sink(2, 1)).^2 + (Y - sink(2, 2)).^2));

V = (st / (2 * pi)) .* ((Y - source(1, 2)) ./ ((X - source(1, 1)).^2 + (Y - source(1, 2)).^2) + ...
                        (Y - source(2, 2)) ./ ((X - source(2, 1)).^2 + (Y - source(2, 2)).^2) - ...
                        (Y - sink(1, 2)) ./ ((X - sink(1, 1)).^2 + (Y - sink(1, 2)).^2) - ...
                        (Y - sink(2, 2)) ./ ((X - sink(2, 1)).^2 + (Y - sink(2, 2)).^2));
```
- The `meshgrid` function creates a 2D grid of points for evaluation.
- Velocity components `U` and `V` are computed based on the positions and strengths of the sources and sinks using the equations of potential flow.

### Streamline Circle
```matlab
R = 3;                  % Radius of the circle
theta = 0:0.1:2*pi;     % Angle range for the circle

X_circle = R * cos(theta); % X-coordinates of the circle
Y_circle = R * sin(theta); % Y-coordinates of the circle
```
This section calculates the coordinates of a circle with radius \( R = 3 \).

### Visualization
```matlab
quiver(X, Y, U, V, 5); hold on
plot(source(:, 1), source(:, 2), "o", MarkerSize = 5, MarkerFaceColor = "r")
plot(sink(:, 1), sink(:, 2), "o", MarkerSize = 5, MarkerFaceColor = "b")
plot(X_circle, Y_circle)
title('Velocity Field and Streamline Circle');
legend('Velocity Field', 'Sources', 'Sinks', 'Streamline Circle');
axis equal
```


![image](https://github.com/user-attachments/assets/e5364db7-9db5-4368-8a61-bb21d65f6d37)

- `quiver`: Displays the velocity vectors as arrows.
- `plot`: Plots the source and sink positions, and overlays the streamline circle.
- `legend`: Adds a legend for clarity.
- `axis equal`: Ensures the aspect ratio is consistent.
---

## Output
The script generates a plot that includes:
- The velocity field represented by arrows.
- Two red circles marking the positions of the sources.
- Two blue circles marking the positions of the sinks.
- A streamline circle centered at the origin.

## Usage
1. Copy and paste the code into a MATLAB script file.
2. Run the script in MATLAB.
3. Observe the visualization of the velocity field and the streamline circle.

---

Feel free to customize the source/sink positions, strengths, or streamline circle parameters to explore different flow patterns!


## Author

 [@NayeemulHasan](https://www.github.com/nayeemulhasan0)

