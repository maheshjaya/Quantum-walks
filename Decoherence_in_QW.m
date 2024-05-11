clear;
clc;
close all;
j=sqrt(-1);

step1=40; %QW runs without decoherence
step2=160; %QW runs with decoherence

step=step1+step2; %total step size

N=2*step+3; %size of the line
mid =step+2; %middle point

%Coin operator
al=45;
u1=0;
u2=0;

alpha=(pi*al)/180;
u11=(pi*u1)/180;
u22=(pi*u2)/180;

C(1,1)=cosd(alpha);
C(1,2)=exp(j*u11)*sind(alpha);
C(2,1)=exp(j*u22)*sind(alpha);
C(2,2)=-exp(j*(u11+u22))*cosd(alpha);

%No of trials

NT=500;  % No of trials 
S=zeros(1,N);

for trial=1:NT

%Amplitude Matrix
At1=zeros(1,N);
At2=zeros(1,N);
A1=zeros(1,N);
A2=zeros(1,N);

%Initial Coinditions of Amplitude Matrix
At1(mid) = sqrt(0.5);
At2(mid) = -sqrt(0.5);

%Amplitude Calculation Loop for step1
for k= 1:step1
        for m = 2:N-1
            A1(m)=C(1,1)*At1(m-1)+C(1,2)*At2(m-1);
            A2(m)=C(2,1)*At1(m+1)+C(2,2)*At2(m+1);  
        end
    At1=A1;
    At2=A2;
end

%Amplitude Calculation Loop for step2
for k= 1:step2
    b=2*pi*rand; %random phase
 
    for m = 2:N-1
        A1(m)=C(1,1)*At1(m-1)+exp(j*b)*C(1,2)*At2(m-1);
        A2(m)=exp(-j*b)*C(2,1)*At1(m+1)+C(2,2)*At2(m+1);      
    end 
    At1=A1;
    At2=A2;
end

%Probability Calculation Loop
P=zeros(1,N);
for m = 1:N         
    P(m) = At1(m)*conj(At1(m))+ At2(m)*conj(At2(m)); 
end

S=S+P;

end

%Normalizing the probability
U=S/trial;

%Labeling of the x-axis from -N to N
x=zeros(1,N);
for m = 1:N          
    x(m)= -((N+1)/2)+ m;
end

%Standard deviation calculation
QEx=0;
QExx=0;

for m=1:N
    QEx=QEx+ x(m)*U(m);
    QExx=QExx+ x(m)^2*U(m);
end


QRWstandard_deviation=sqrt(QExx-QEx^2);
QRWtotal_probability =sum(sum(U));

plot(x,U)
xlabel('Position')
ylabel('Quantum Probability Distribution')
title(['step=' num2str(step) '' '  '  'trial=' num2str(trial) '' '  '  'Std=' num2str(QRWstandard_deviation) '' '  ' 'Max=' num2str(max(U)) ''])




