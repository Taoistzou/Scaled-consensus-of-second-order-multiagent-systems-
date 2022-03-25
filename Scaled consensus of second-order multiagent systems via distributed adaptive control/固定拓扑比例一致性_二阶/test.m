close all
x=-10:0.01:10;
y1=[];
y2=[];
y3=[];
y4=[];
y5=[];
y6=[];
y7=[];
for t=-10:0.01:10
    y=0.9*t+0.6*sin(t);
    y1=[y1,y];
    y=0.9*sin(t)+0.9;
    y2=[y2,y];
    y=0.7*sin(t)+abs(t);
    y3=[y3,y];
    y=0.9*exp(-(abs(t)+1))+0.8*t;
    y4=[y4,y];
    y=0.5*cos(t)+0.9*t;
    y5=[y5,y];
    y=0.3*cos(t)+0.9;
    y6=[y6,y];
    y=abs(t)+0.9
    y7=[y7,y];
end
plot(x,y4-y7)
    