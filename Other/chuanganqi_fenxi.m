clc
clear
%%
%求传感器实验数据 灵敏度 k，非线性误差(线性度) rL，迟滞 rH，重复性 rR
%%
%输入数据 X：质量  Y：电压
m=6;n=3;   %m个测量点，n个来回 （记得改）
x1=[2 4 6 8 10 12];       %正行程的m个测量点
yu=[44 95 170 315 540 750;
    37 89 171 310 550 760 ;
    45 98 180 312 545 750];  %正行程测量数据
yd=[45 100 183 332 575 746;
    40 93 184 320 560 754;
    44 102 190 314 560 755];  %反行程测量数据
x2=x1; 
for i=1:(2*n-1)             %扩展到全部的测点，2*n个横坐标轴（X)
    x2=vertcat(x2,x1);
    i=i+1;
end                       
y=[yu;yd];            %所有测量数据（Y）组成n×m矩阵
xmean=mean(mean(x2));     %x2的总均值
ymean=mean(mean(y)) ;    %y的总均值
%%
%以下为求非线性误差与灵敏度
lxx=sum(sum((x2-xmean).^2));  
lxy=sum(sum((x2-xmean).*(y-ymean)));  
k=lxy./lxx    %拟合直线斜率 即灵敏度（实验使用的是线性传感器）         
b=ymean-k*xmean
X=x1;
Y1=k.*X+b;               %拟合直线
Y=Y1;
for j=1:(2*n-1)
    Y=vertcat(Y,Y1);
    j=j+1;
end                        %Y由一维扩展到2n×m矩阵
dLmax=max(max(abs(y-Y)));   %曲线与直线的最大差值
yFS=max(max(y))-min(min(y));  %满量程输出
rL=dLmax./yFS       %线性度 即非线性误差
%%
%求迟滞
DyiH=abs(yu-yd);     %正反行程的偏差
DHmax=max(max(DyiH));        %正反行程的最大偏差
rH=DHmax./yFS                %迟滞误差
%%
%重复性
wu=max(yu)-min(yu); %正行程极差
wd=max(yd)-min(yd);%反行程极差
rR=max(max(wu),max(wd))/(2*yFS)  %重复性指标      