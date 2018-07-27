clc
clear
%Gibbs现象的MATLAB实现
dt=1e-5;      %曲线图像上各点的间隔
dn=10;         %最大谐波数的选取步长
t=-pi:dt:pi;  %生成时间轴，也就是相当于X轴
omega=1;      % "omega"是角频率的音译
y=square(t+pi/2,50); 
%y=square(t,ty)产生一个 2π,幅值为 ±1 的周期性方波, duty表示占空比(duty cycle)
%t+pi/2是将图像向左移，与信号与系统课本第126页上的图形一致
n_max=[1:dn:79];  %最大谐波数集合
N=length(n_max); 
%动态显示过程
for k=1:N
n=1:2:n_max(k); %每个最大谐波数所对应的 谐波数数组
%傅里叶展开式
b=4./(pi*n);    
x=b*sin(omega*n'*(t+pi/2));
%绘图
%抖个机灵，此处删去了调用了调用 设置画面窗口 Figure 命令，这是做动画的第一步。
%不删去它图像也是动态的，但不算是动画，你可以改改看一看。删去以后就不会打开很多窗口了，图像将在一个窗口依次显示
plot(t,y);
hold on;      %与下面的 hold off共同作用，让 x 与 y 的图像显示在一个坐标轴上
plot(t,x);
hold off;
xlabel('t'),ylabel('合成后的波形')     %两句分别定义 x 与 y 轴的名称
axis([-pi pi -1.5 1.5])                % 定义坐标轴的范围X轴：-pi~pi  Y轴 ： -1.5~1.5
grid on    % grid on 是坐标轴使用网格
title(['谐波数=',num2str(n_max(k))])   % 图形标题

set(gcf,'DoubleBuffer','on'); 
% set（句柄，'属性名','属性值')是一个函数， 句柄是 MATLAB 语言独有的，相当于C语言的指针
% DoubleBuffer 是使用双缓冲，在计算下一张图形同时，显示上一张绘制好的图，避免图形切换过快而闪烁。
drawnow;
end
%抽取4张显示%
n_max=[1 3 7 79];
for k=1:4
n=1:2:n_max(k);
b=4./(pi*n);
x=b*sin(omega*n'*(t+pi/2));
subplot(2,2,k);
plot(t,y);
hold on;
plot(t,x);
hold off;
xlabel('t'),ylabel('合成后的波形')
axis([-pi pi -1.5 1.5])
grid on
title(['谐波数=',num2str(n_max(k))])
end


