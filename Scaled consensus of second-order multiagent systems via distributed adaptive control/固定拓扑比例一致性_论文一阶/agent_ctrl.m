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
sizes.NumInputs      = 6;
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

 %控制器参数
 mu_1=1;alpha=2;
 
 
 

s1=1;s2=1/2;s3=1/3;s4=1/4;s5=1/5;s6=1/6;

%二分一致性
% s1=1;s2=1;s3=1;s4=-1;s5=-1;s6=-1;

%%群一致性 
% s1=1;s2=1;s3=1/2;s4=1/2;s5=1/3;s6=1/3;

% %完全一致性
% s1=1;s2=1;s3=1; s4=1;s5=1;s6=1;


x1=u(1);
x2=u(2);
x3=u(3);
x4=u(4);
x5=u(5);
x6=u(6);



z1=aij(1,1)/s1*sig(s1*x1-s1*x1,mu_1)+aij(1,2)/s1*sig(s2*x2-s1*x1,mu_1)+aij(1,3)/s1*sig(s3*x3-s1*x1,mu_1)+...
   aij(1,4)/s1*sig(s4*x4-s1*x1,mu_1)+aij(1,5)/s1*sig(s5*x5-s1*x1,mu_1)+aij(1,6)/s1*sig(s6*x6-s1*x1,mu_1);
z2=aij(2,1)/s2*sig(s1*x1-s2*x2,mu_1)+aij(2,2)/s2*sig(s2*x2-s2*x2,mu_1)+aij(2,3)/s2*sig(s3*x3-s2*x2,mu_1)+...
   aij(2,4)/s2*sig(s4*x4-s2*x2,mu_1)+aij(2,5)/s2*sig(s5*x5-s2*x2,mu_1)+aij(2,6)/s2*sig(s6*x6-s2*x2,mu_1);
z3=aij(3,1)/s3*sig(s1*x1-s3*x3,mu_1)+aij(3,2)/s3*sig(s2*x2-s3*x3,mu_1)+aij(3,3)/s3*sig(s3*x3-s3*x3,mu_1)+...
   aij(3,4)/s3*sig(s4*x4-s3*x3,mu_1)+aij(3,5)/s3*sig(s5*x5-s3*x3,mu_1)+aij(3,6)/s3*sig(s6*x6-s3*x3,mu_1);
z4=aij(4,1)/s4*sig(s1*x1-s4*x4,mu_1)+aij(4,2)/s4*sig(s2*x2-s4*x4,mu_1)+aij(4,3)/s4*sig(s3*x3-s4*x4,mu_1)+...
   aij(4,4)/s4*sig(s4*x4-s4*x4,mu_1)+aij(4,5)/s4*sig(s5*x5-s4*x4,mu_1)+aij(4,6)/s4*sig(s6*x6-s4*x4,mu_1);
z5=aij(5,1)/s4*sig(s1*x1-s5*x5,mu_1)+aij(5,2)/s4*sig(s2*x2-s5*x5,mu_1)+aij(5,3)/s4*sig(s3*x3-s5*x5,mu_1)+...
   aij(5,4)/s4*sig(s4*x4-s5*x5,mu_1)+aij(5,5)/s4*sig(s5*x5-s5*x5,mu_1)+aij(5,6)/s4*sig(s6*x6-s5*x5,mu_1);
z6=aij(6,1)/s4*sig(s1*x1-s6*x6,mu_1)+aij(6,2)/s4*sig(s2*x2-s6*x6,mu_1)+aij(6,3)/s4*sig(s3*x3-s6*x6,mu_1)+...
   aij(6,4)/s4*sig(s4*x4-s6*x6,mu_1)+aij(6,5)/s4*sig(s5*x5-s6*x6,mu_1)+aij(6,6)/s4*sig(s6*x6-s6*x6,mu_1);

u_1=alpha*z1;
u_2=alpha*z2;
u_3=alpha*z3;
u_4=alpha*z4;
u_5=alpha*z5;
u_6=alpha*z6;



sys(1)=u_1;
sys(2)=u_2;
sys(3)=u_3;
sys(4)=u_4;
sys(5)=u_5;
sys(6)=u_6;

















