clear;clc;

source=[3 0; -3 0];
sink=[0 3; 0 -3];
st=1;

[X Y]=meshgrid(linspace(-5,5,100));

U= (st/2*pi).*( (X-source(1,1))./( (X-source(1,1)).^2 + (Y-source(1,2)).^2 ) + ...
                (X-source(2,1))./( (X-source(2,1)).^2 + (Y-source(2,2)).^2 ) - ...
                (X-sink(1,1))./( (X-sink(1,1)).^2 + (Y-sink(1,2)).^2 ) - ...
                (X-sink(2,1))./( (X-sink(2,1)).^2 + (Y-sink(2,2)).^2 ) );

V= (st/2*pi).*( (Y-source(1,2))./( (X-source(1,1)).^2 + (Y-source(1,2)).^2 ) + ...
                (Y-source(2,2))./( (X-source(2,1)).^2 + (Y-source(2,2)).^2 ) - ...
                (Y-sink(1,2))./( (X-sink(1,1)).^2 + (Y-sink(1,2)).^2 ) - ...
                (Y-sink(2,2))./( (X-sink(2,1)).^2 + (Y-sink(2,2)).^2 ) );


%circle
R=3;
theta=0:0.1:2*pi;

X_circle=R*cos(theta);
Y_circle=R*sin(theta);



quiver(X,Y,U,V,5);hold on
plot(source(:,1),source(:,2),"o",MarkerSize=5,MarkerFaceColor="r")
plot(sink(:,1),sink(:,2),"o",MarkerSize=5,MarkerFaceColor="b")
plot(X_circle,Y_circle)
title('Velocity Field and Streamline Circle');
legend('Velocity Field', 'Sources', 'Sinks', 'Streamline Circle');
axis equal

