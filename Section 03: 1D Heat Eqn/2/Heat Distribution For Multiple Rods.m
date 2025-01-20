clear;clc;

L=10;nterms=3;

a_Ag=sqrt(1.71);a_Cu=sqrt(1.14);
a_Al=sqrt(0.86);a_Fe=sqrt(0.12);

xspan=0:0.5:10;
tspan=0:1:160;
[X,T]=meshgrid(xspan,tspan);


syms x t n a u(x,t,n,a)
u0(x)=10+2*x 
u(x,t,n,a)= (20/pi)*( (3*(-1)^n -1)/n *sin(n*pi*x/L)* exp(-(n*pi*a/L)^2 *t) ) 



fprintf(".................................. Ag ...................................")

Arr_Ag=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr_Ag=Arr_Ag+eval(u(X,T,n,a_Ag));
end

Arr_Ag=Arr_Ag+eval(u0(X));
figure;
surf(X,T,Arr_Ag)
title("heat dstr of Ag rod")


fprintf(".................................. Cu ...................................")

Arr_Cu=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr_Cu=Arr_Cu+eval(u(X,T,n,a_Cu));
end

Arr_Cu=Arr_Cu+eval(u0(X));
figure;
surf(X,T,Arr_Cu)
title("heat dstr of Cu rod")



fprintf(".................................. Al ...................................")

Arr_Al=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr_Al=Arr_Al+eval(u(X,T,n,a_Al));
end

Arr_Al=Arr_Al+eval(u0(X));
figure;
surf(X,T,Arr_Al)
title("heat dstr of Al rod")




fprintf(".................................. Fe ...................................")

Arr_Fe=zeros(length(tspan),length(xspan));

for n=1:nterms
    Arr_Fe=Arr_Fe+eval(u(X,T,n,a_Fe));
end

Arr_Fe=Arr_Fe+eval(u0(X));
figure;
surf(X,T,Arr_Fe)
title("heat dstr of Fe rod")





fprintf("........... OTTOBI ........... OTTOBI ........... OTTOBI ...........")
fprintf("........... OTTOBI ........... OTTOBI ........... OTTOBI ...........")
fprintf("........... OTTOBI ........... OTTOBI ........... OTTOBI ...........")


% at t=1sec 
t=1;

Table1=zeros(length(xspan),5);

for i=1:length(xspan)
    Table1(i,:)=[xspan(i) Arr_Ag(t+1,i) Arr_Cu(t+1,i) Arr_Al(t+1,i) Arr_Fe(t+1,i)];
end

fprintf("at t=1sec")
array2table(Table1,'VariableNames',{'X','Ag','Cu','Al','Fe'})





% at t=10sec 
t=10;

Table2=zeros(length(xspan),5);

for i=1:length(xspan)
    Table2(i,:)=[xspan(i) Arr_Ag(t+1,i) Arr_Cu(t+1,i) Arr_Al(t+1,i) Arr_Fe(t+1,i)];
end

fprintf("at t=10sec")
array2table(Table2,'VariableNames',{'X','Ag','Cu','Al','Fe'})




% at t=20sec 
t=20;

Table3=zeros(length(xspan),5);

for i=1:length(xspan)
    Table3(i,:)=[xspan(i) Arr_Ag(t+1,i) Arr_Cu(t+1,i) Arr_Al(t+1,i) Arr_Fe(t+1,i)];
end

fprintf("at t=20sec")
array2table(Table3,'VariableNames',{'X','Ag','Cu','Al','Fe'})







%%%%%%%%%%%%%%%%%%%%%%%%%%% time to reach 15C at midpoint %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% time to reach 15C at midpoint %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% time to reach 15C at midpoint %%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%Ag

for i=1:length(tspan)
    if Arr_Ag(i,floor(size(Arr_Ag,2)/2)) -15 >0.1
       break;
    end
end

time_to_reach_15K_at_midpoint_of_Ag_rod=i-1


%%%%Cu

for i=1:length(tspan)
    if Arr_Cu(i,floor(size(Arr_Cu,2)/2)) -15 >0.1
       break;
    end
end

time_to_reach_15K_at_midpoint_of_Cu_rod=i-1




%%%%Al

for i=1:length(tspan)
    if Arr_Al(i,floor(size(Arr_Al,2)/2)) -15 > 0.1
       break;
    end
end

time_to_reach_15K_at_midpoint_of_Al_rod=i-1



%%%%Fe

for i=1:length(tspan)
    if Arr_Fe(i,floor(size(Arr_Fe,2)/2)) -15 > 0.1
       break;
    end
end

time_to_reach_15K_at_midpoint_of_Fe_rod=i-1





