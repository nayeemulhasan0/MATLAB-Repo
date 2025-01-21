# Heat Distribution Analysis for different Metal Rods

![imgonline-com-ua-Negative-PLvsXsASA2xl70](https://github.com/user-attachments/assets/675e93f3-bbe5-49be-96a9-59ff8edb806c)

---

## Description

The script performs the following tasks:
1. **Define Parameters**:
   - Rod length (`L`): 10 units
   - Number of terms for Fourier series approximation (`nterms`): 3
   - Thermal diffusivity values for different metals: Silver, Copper, Aluminum, Iron.

2. **Mathematical Setup**:
   - Uses Fourier series to compute temperature distribution as a function of space and time.
   - Initial temperature distribution: \( u_0(x) = 10 + 2x \).

3. **Compute and Visualize Heat Distribution**:
   - Calculates temperature distribution for each metal.
   - Generates 3D surface plots of temperature distribution over time.

4. **Extract and Tabulate Results**:
   - Produces temperature tables at specific times (1 sec, 10 sec, 20 sec).
   - Computes time required for the midpoint of the rod to reach 15°C.

---

## Code Walkthrough

### Parameters and Initialization

```matlab
L = 10; nterms = 3;

a_Ag = sqrt(1.71); a_Cu = sqrt(1.14);
a_Al = sqrt(0.86); a_Fe = sqrt(0.12);

xspan = 0:0.5:10;
tspan = 0:1:160;
[X, T] = meshgrid(xspan, tspan);

syms x t n a u(x,t,n,a)
u0(x) = 10 + 2*x;
u(x,t,n,a) = (20/pi) * ((3*(-1)^n - 1)/n * sin(n*pi*x/L) * exp(-(n*pi*a/L)^2 * t));
```

### Heat Distribution Calculations
For Silver (Ag):

```matlab

Arr_Ag = zeros(length(tspan), length(xspan));

for n = 1:nterms
    Arr_Ag = Arr_Ag + eval(u(X, T, n, a_Ag));
end    

Arr_Ag = Arr_Ag + eval(u0(X));
figure;
surf(X, T, Arr_Ag);
title("Heat Distribution of Ag Rod");

```
![image](https://github.com/user-attachments/assets/aa437d48-160c-41af-8be3-8133eb9ba645)


Similar calculations are repeated for Copper (Cu), Aluminum (Al), and Iron (Fe).


### Tabulated Results
The script generates tables showing temperatures at positions along the rods (xspan) for times 1 sec, 10 sec, and 20 sec:

```matlab
% Example for t = 1 sec
t = 1;
Table1 = zeros(length(xspan), 5);

for i = 1:length(xspan)
    Table1(i, :) = [xspan(i), Arr_Ag(t+1, i), Arr_Cu(t+1, i), Arr_Al(t+1, i), Arr_Fe(t+1, i)];
end

array2table(Table1, 'VariableNames', {'X', 'Ag', 'Cu', 'Al', 'Fe'})
```
at t=1 sec

     X       Ag          Cu           Al          Fe   
    ___    _______    _________    ________    ________

      0         10           10          10          10
    0.5     7.7929       7.2948      6.9463      5.4756
      1     5.7545       4.8596       4.237      1.6196
    1.5     4.0211       2.9078      2.1421     -1.0487
      2     2.6716       1.5528     0.80112     -2.2737
    2.5      1.717       0.7885     0.19639     -2.1179
      3     1.1061      0.49838     0.16469    -0.94224
    3.5    0.74714      0.49138      0.4433      0.6835
      4    0.54007      0.55702     0.74128      2.1203
    4.5    0.41211      0.52692     0.81957      2.8195
      5    0.34828      0.32853     0.56163      2.4651
    5.5    0.40898     0.018286    0.017732       1.067
      6    0.72989     -0.21467    -0.58814     -1.0173
    6.5     1.5029    -0.076294    -0.89201     -3.1406
      7     2.9411      0.77761    -0.45848     -4.4912
    7.5     5.2347       2.6704      1.1295     -4.2612

Same shits are repeated for time 10 sec & 20 sec.


### Time to Reach 15°C at Midpoint
The script calculates the time required for the midpoint of each rod to reach 15°C:

```matlab 
% Example for Silver (Ag)
for i = 1:length(tspan)
    if Arr_Ag(i, floor(size(Arr_Ag, 2)/2)) - 15 > 0.1
        break;
    end
end
time_to_reach_15K_at_midpoint_of_Ag_rod = i - 1;

```


     time_to_reach_15K_at_midpoint_of_Ag_rod = 12
 

Same for Copper (Cu), Aluminum (Al), and Iron (Fe).



## Summary
This MATLAB script analyzes heat distribution in metal rods (Silver, Copper, Aluminum, and Iron) using Fourier series. 
It visualizes temperature changes over time, computes values at specific times (1 sec, 10 sec, 20 sec), and determines 
the time required for the midpoint of each rod to reach 15°C. The script highlights differences in thermal behavior across 
materials, producing surface plots and temperature tables for analysis.

## Author

 [@NayeemulHasan](https://www.github.com/nayeemulhasan0)

