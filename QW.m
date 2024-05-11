clear;
clc;
close all;
j=sqrt(-1);

step=200; %number of steps of the QW

N=2*step+3; %length of the line
mid =step+2; %middle point


%Coin operator
alpha=45;
u1=0;
u2=0;

u11=(pi*u1)/180;
u22=(pi*u2)/180;

C(1,1)=cosd(alpha);
C(1,2)=exp(j*u11)*sind(alpha);
C(2,1)=exp(j*u22)*sind(alpha);
C(2,2)=-exp(j*(u11+u22))*cosd(alpha);

  
%Amplitude Matrix
At1=zeros(1,N);
At2=zeros(1,N);
A1=zeros(1,N);
A2=zeros(1,N);


%Initial Coinditions of Amplitude Matrix
At1(mid) = sqrt(0.5);
At2(mid) = -sqrt(0.5);


for k= 1:step
 
    for m = 2:N-1
    A1(m)=C(1,1)*At1(m-1)+C(1,2)*At2(m-1);
    A2(m)=C(2,1)*At1(m+1)+C(2,2)*At2(m+1);  
    end
 
At1=A1;
At2=A2;
end

%Probability Calculation Loop
P=zeros(1,N);
for m = 1:N         
P(m) = At1(m)*conj(At1(m))+ At2(m)*conj(At2(m)); 
x(m)= -((N+1)/2)+ m;
end


%Standard deviation calculation
QEx=0;
QExx=0;

for m=1:N
    QEx=QEx+ x(m)*P(m);
    QExx=QExx+ x(m)^2*P(m);
end


QRWstandard_deviation=sqrt(QExx-QEx^2);
QRWtotal_probability =sum(sum(P));

plot(x,P)
xlabel('Position')
ylabel('Quantum Probability Distribution')
title(['step=' num2str(step) '' '  '  'Std=' num2str(QRWstandard_deviation) '' '  ' 'Max=' num2str(max(P)) ''])



