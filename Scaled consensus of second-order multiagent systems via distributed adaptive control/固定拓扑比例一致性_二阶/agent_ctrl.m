function [sys,x0,str,ts] = agent_ctrl(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[]; 
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)

aij=[0 1 0 0 0 1;
     1 0 1 0 0 0;
     0 1 0 1 0 0;
     0 0 1 0 1 0;
     0 0 0 1 0 1;
     1 0 0 0 1 0];

p=5/3;q=3/5;alpha=2;beta=2;
s1=1;s2=1/2;s3=1/3;s4=1/4;s5=1/5;s6=1/6;

%二分一致性
% s1=1;s2=1;s3=1;s4=-1;s5=-1;s6=-1;

%%群一致性 
% s1=1;s2=1;s3=1/2; s4=1/2;s5=1/3;s6=1/3;

% %完全一致性
% s1=1;s2=1;s3=1;s4=1;s5=1;s6=1;


x1=u(1);
x2=u(2);
x3=u(3);
x4=u(4);
x5=u(5);
x6=u(6);

v1=u(1+6);
v2=u(2+6);
v3=u(3+6);
v4=u(4+6);
v5=u(5+6);
v6=u(6+6);


zp1=aij(1,1)/s1*sig(s1*x1-s1*x1,p)+aij(1,2)/s1*sig(s2*x2-s1*x1,p)+aij(1,3)/s1*sig(s3*x3-s1*x1,p)+...
   aij(1,4)/s1*sig(s4*x4-s1*x1,p)+aij(1,5)/s1*sig(s5*x5-s1*x1,p)+aij(1,6)/s1*sig(s6*x6-s1*x1,p);
zp2=aij(2,1)/s2*sig(s1*x1-s2*x2,p)+aij(2,2)/s2*sig(s2*x2-s2*x2,p)+aij(2,3)/s2*sig(s3*x3-s2*x2,p)+...
   aij(2,4)/s2*sig(s4*x4-s2*x2,p)+aij(2,5)/s2*sig(s5*x5-s2*x2,p)+aij(2,6)/s2*sig(s6*x6-s2*x2,p);
zp3=aij(3,1)/s3*sig(s1*x1-s3*x3,p)+aij(3,2)/s3*sig(s2*x2-s3*x3,p)+aij(3,3)/s3*sig(s3*x3-s3*x3,p)+...
   aij(3,4)/s3*sig(s4*x4-s3*x3,p)+aij(3,5)/s3*sig(s5*x5-s3*x3,p)+aij(3,6)/s3*sig(s6*x6-s3*x3,p);
zp4=aij(4,1)/s4*sig(s1*x1-s4*x4,p)+aij(4,2)/s4*sig(s2*x2-s4*x4,p)+aij(4,3)/s4*sig(s3*x3-s4*x4,p)+...
   aij(4,4)/s4*sig(s4*x4-s4*x4,p)+aij(4,5)/s4*sig(s5*x5-s4*x4,p)+aij(4,6)/s4*sig(s6*x6-s4*x4,p);
zp5=aij(5,1)/s4*sig(s1*x1-s5*x5,p)+aij(5,2)/s4*sig(s2*x2-s5*x5,p)+aij(5,3)/s4*sig(s3*x3-s5*x5,p)+...
   aij(5,4)/s4*sig(s4*x4-s5*x5,p)+aij(5,5)/s4*sig(s5*x5-s5*x5,p)+aij(5,6)/s4*sig(s6*x6-s5*x5,p);
zp6=aij(6,1)/s4*sig(s1*x1-s6*x6,p)+aij(6,2)/s4*sig(s2*x2-s6*x6,p)+aij(6,3)/s4*sig(s3*x3-s6*x6,p)+...
   aij(6,4)/s4*sig(s4*x4-s6*x6,p)+aij(6,5)/s4*sig(s5*x5-s6*x6,p)+aij(6,6)/s4*sig(s6*x6-s6*x6,p);

zq1=aij(1,1)/s1*sig(s1*x1-s1*x1,q)+aij(1,2)/s1*sig(s2*x2-s1*x1,q)+aij(1,3)/s1*sig(s3*x3-s1*x1,q)+...
   aij(1,4)/s1*sig(s4*x4-s1*x1,q)+aij(1,5)/s1*sig(s5*x5-s1*x1,q)+aij(1,6)/s1*sig(s6*x6-s1*x1,q);
zq2=aij(2,1)/s2*sig(s1*x1-s2*x2,q)+aij(2,2)/s2*sig(s2*x2-s2*x2,q)+aij(2,3)/s2*sig(s3*x3-s2*x2,q)+...
   aij(2,4)/s2*sig(s4*x4-s2*x2,q)+aij(2,5)/s2*sig(s5*x5-s2*x2,q)+aij(2,6)/s2*sig(s6*x6-s2*x2,q);
zq3=aij(3,1)/s3*sig(s1*x1-s3*x3,q)+aij(3,2)/s3*sig(s2*x2-s3*x3,q)+aij(3,3)/s3*sig(s3*x3-s3*x3,q)+...
   aij(3,4)/s3*sig(s4*x4-s3*x3,q)+aij(3,5)/s3*sig(s5*x5-s3*x3,q)+aij(3,6)/s3*sig(s6*x6-s3*x3,q);
zq4=aij(4,1)/s4*sig(s1*x1-s4*x4,q)+aij(4,2)/s4*sig(s2*x2-s4*x4,q)+aij(4,3)/s4*sig(s3*x3-s4*x4,q)+...
   aij(4,4)/s4*sig(s4*x4-s4*x4,q)+aij(4,5)/s4*sig(s5*x5-s4*x4,q)+aij(4,6)/s4*sig(s6*x6-s4*x4,q);
zq5=aij(5,1)/s4*sig(s1*x1-s5*x5,q)+aij(5,2)/s4*sig(s2*x2-s5*x5,q)+aij(5,3)/s4*sig(s3*x3-s5*x5,q)+...
   aij(5,4)/s4*sig(s4*x4-s5*x5,q)+aij(5,5)/s4*sig(s5*x5-s5*x5,q)+aij(5,6)/s4*sig(s6*x6-s5*x5,q);
zq6=aij(6,1)/s4*sig(s1*x1-s6*x6,q)+aij(6,2)/s4*sig(s2*x2-s6*x6,q)+aij(6,3)/s4*sig(s3*x3-s6*x6,q)+...
   aij(6,4)/s4*sig(s4*x4-s6*x6,q)+aij(6,5)/s4*sig(s5*x5-s6*x6,q)+aij(6,6)/s4*sig(s6*x6-s6*x6,q);

yp1=aij(1,1)/s1*sig(s1*v1-s1*v1,p)+aij(1,2)/s1*sig(s2*v2-s1*v1,p)+aij(1,3)/s1*sig(s3*v3-s1*v1,p)+...
   aij(1,4)/s1*sig(s4*v4-s1*v1,p)+aij(1,5)/s1*sig(s5*v5-s1*v1,p)+aij(1,6)/s1*sig(s6*v6-s1*v1,p);
yp2=aij(2,1)/s2*sig(s1*v1-s2*v2,p)+aij(2,2)/s2*sig(s2*v2-s2*v2,p)+aij(2,3)/s2*sig(s3*v3-s2*v2,p)+...
   aij(2,4)/s2*sig(s4*v4-s2*v2,p)+aij(2,5)/s2*sig(s5*v5-s2*v2,p)+aij(2,6)/s2*sig(s6*v6-s2*v2,p);
yp3=aij(3,1)/s3*sig(s1*v1-s3*v3,p)+aij(3,2)/s3*sig(s2*v2-s3*v3,p)+aij(3,3)/s3*sig(s3*v3-s3*v3,p)+...
   aij(3,4)/s3*sig(s4*v4-s3*v3,p)+aij(3,5)/s3*sig(s5*v5-s3*v3,p)+aij(3,6)/s3*sig(s6*v6-s3*v3,p);
yp4=aij(4,1)/s4*sig(s1*v1-s4*v4,p)+aij(4,2)/s4*sig(s2*v2-s4*v4,p)+aij(4,3)/s4*sig(s3*v3-s4*v4,p)+...
   aij(4,4)/s4*sig(s4*v4-s4*v4,p)+aij(4,5)/s4*sig(s5*v5-s4*v4,p)+aij(4,6)/s4*sig(s6*v6-s4*v4,p);
yp5=aij(5,1)/s4*sig(s1*v1-s5*v5,p)+aij(5,2)/s4*sig(s2*v2-s5*v5,p)+aij(5,3)/s4*sig(s3*v3-s5*v5,p)+...
   aij(5,4)/s4*sig(s4*v4-s5*v5,p)+aij(5,5)/s4*sig(s5*v5-s5*v5,p)+aij(5,6)/s4*sig(s6*v6-s5*v5,p);
yp6=aij(6,1)/s4*sig(s1*v1-s6*v6,p)+aij(6,2)/s4*sig(s2*v2-s6*v6,p)+aij(6,3)/s4*sig(s3*v3-s6*v6,p)+...
   aij(6,4)/s4*sig(s4*v4-s6*v6,p)+aij(6,5)/s4*sig(s5*v5-s6*v6,p)+aij(6,6)/s4*sig(s6*v6-s6*v6,p);

yq1=aij(1,1)/s1*sig(s1*v1-s1*v1,q)+aij(1,2)/s1*sig(s2*v2-s1*v1,q)+aij(1,3)/s1*sig(s3*v3-s1*v1,q)+...
   aij(1,4)/s1*sig(s4*v4-s1*v1,q)+aij(1,5)/s1*sig(s5*v5-s1*v1,q)+aij(1,6)/s1*sig(s6*v6-s1*v1,q);
yq2=aij(2,1)/s2*sig(s1*v1-s2*v2,q)+aij(2,2)/s2*sig(s2*v2-s2*v2,q)+aij(2,3)/s2*sig(s3*v3-s2*v2,q)+...
   aij(2,4)/s2*sig(s4*v4-s2*v2,q)+aij(2,5)/s2*sig(s5*v5-s2*v2,q)+aij(2,6)/s2*sig(s6*v6-s2*v2,q);
yq3=aij(3,1)/s3*sig(s1*v1-s3*v3,q)+aij(3,2)/s3*sig(s2*v2-s3*v3,q)+aij(3,3)/s3*sig(s3*v3-s3*v3,q)+...
   aij(3,4)/s3*sig(s4*v4-s3*v3,q)+aij(3,5)/s3*sig(s5*v5-s3*v3,q)+aij(3,6)/s3*sig(s6*v6-s3*v3,q);
yq4=aij(4,1)/s4*sig(s1*v1-s4*v4,q)+aij(4,2)/s4*sig(s2*v2-s4*v4,q)+aij(4,3)/s4*sig(s3*v3-s4*v4,q)+...
   aij(4,4)/s4*sig(s4*v4-s4*v4,q)+aij(4,5)/s4*sig(s5*v5-s4*v4,q)+aij(4,6)/s4*sig(s6*v6-s4*v4,q);
yq5=aij(5,1)/s4*sig(s1*v1-s5*v5,q)+aij(5,2)/s4*sig(s2*v2-s5*v5,q)+aij(5,3)/s4*sig(s3*v3-s5*v5,q)+...
   aij(5,4)/s4*sig(s4*v4-s5*v5,q)+aij(5,5)/s4*sig(s5*v5-s5*v5,q)+aij(5,6)/s4*sig(s6*v6-s5*v5,q);
yq6=aij(6,1)/s4*sig(s1*v1-s6*v6,q)+aij(6,2)/s4*sig(s2*v2-s6*v6,q)+aij(6,3)/s4*sig(s3*v3-s6*v6,q)+...
   aij(6,4)/s4*sig(s4*v4-s6*v6,q)+aij(6,5)/s4*sig(s5*v5-s6*v6,q)+aij(6,6)/s4*sig(s6*v6-s6*v6,q);

u_1=alpha*zp1+beta*zq1+alpha*yp1+beta*yq1;
u_2=alpha*zp2+beta*zq2+alpha*yp2+beta*yq2;
u_3=alpha*zp3+beta*zq3+alpha*yp3+beta*yq3;
u_4=alpha*zp4+beta*zq4+alpha*yp4+beta*yq4;
u_5=alpha*zp5+beta*zq5+alpha*yp5+beta*yq5;
u_6=alpha*zp6+beta*zq6+alpha*yp6+beta*yq6;

% u_1=real(alpha*zp1+beta*zq1-alpha*v1^p-beta*v1^q);
% u_2=real(alpha*zp2+beta*zq2-alpha*v2^p-beta*v2^q);
% u_3=real(alpha*zp3+beta*zq3-alpha*v3^p-beta*v3^q);
% u_4=real(alpha*zp4+beta*zq4-alpha*v4^p-beta*v4^q);
% u_5=real(alpha*zp5+beta*zq5-alpha*v5^p-beta*v5^q);
% u_6=real(alpha*zp6+beta*zq6-alpha*v6^p-beta*v6^q);





sys(1)=u_1;
sys(2)=u_2;
sys(3)=u_3;
sys(4)=u_4;
sys(5)=u_5;
sys(6)=u_6;

















