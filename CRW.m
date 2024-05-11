clear;
clc;
close all;


step=200; %number of steps of the CRW

N=2*step+3; %length of the line
mid =step+2; %middle point


CL=zeros(1,N);
CLt=zeros(1,N);

CL(mid)=1;

for k=1:step
    for i=2:N-1
        if (CL(i) ~=0)
            CLt(i+1)=CLt(i+1)+CL(i)*0.5;
            CLt(i-1)=CLt(i-1)+CL(i)*0.5;
        end
    end
CL = CLt;

    for i=1:N
        CLt(i)=0;
    end
end

CEx=0;
CExx=0;

%Labeling of the x-axis from -N to N
x=zeros(1,N);
for m = 1:N          
x(m)= -((N+1)/2)+ m;
end

for m=1:N
    CEx=CEx+x(m)*CL(m);
    CExx=CExx+x(m)^2*CL(m);
end


CRWstandard_deviation=sqrt(CExx-CEx^2);
CRWtotal_probability=sum(CL);

plot(x,CL);
title(['step=' num2str(step) '' '  ' 'Std=' num2str(CRWstandard_deviation) '' '  ' 'Max=' num2str(max(CL)) ''])
xlabel('Position')
ylabel('Classical Probability Distribution')



