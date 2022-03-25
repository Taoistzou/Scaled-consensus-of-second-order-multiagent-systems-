function [sys,x0,str,ts]=agent_plant(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1
    sys=mdlDerivatives(t,x,u);
case 3
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 12;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 12;
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
% x0=[1 2 3 4 5 6    1 -1 2 3 -2 -1];
x0=[1 2 3 4 5 6    1 -1 2 3 -2 -1];
str=[];
ts=[0 0];
function sys=mdlDerivatives(t,x,u)

sys(1)=x(1+6);
sys(2)=x(2+6);
sys(3)=x(3+6);
sys(4)=x(4+6);
sys(5)=x(5+6);
sys(6)=x(6+6);

sys(1+6)=u(1);
sys(2+6)=u(2);
sys(3+6)=u(3);
sys(4+6)=u(4);
sys(5+6)=u(5);
sys(6+6)=u(6);



function sys=mdlOutputs(t,x,u)

sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
sys(5)=x(5);
sys(6)=x(6);


sys(7)=x(7);
sys(8)=x(8);
sys(9)=x(9);
sys(10)=x(10);
sys(11)=x(11);
sys(12)=x(12);





