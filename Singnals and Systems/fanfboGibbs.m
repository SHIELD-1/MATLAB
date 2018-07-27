clc
clear
%Gibbs�����MATLABʵ��
dt=1e-5;      %����ͼ���ϸ���ļ��
dn=10;         %���г������ѡȡ����
t=-pi:dt:pi;  %����ʱ���ᣬҲ�����൱��X��
omega=1;      % "omega"�ǽ�Ƶ�ʵ�����
y=square(t+pi/2,50); 
%y=square(t,ty)����һ�� 2��,��ֵΪ ��1 �������Է���, duty��ʾռ�ձ�(duty cycle)
%t+pi/2�ǽ�ͼ�������ƣ����ź���ϵͳ�α���126ҳ�ϵ�ͼ��һ��
n_max=[1:dn:79];  %���г��������
N=length(n_max); 
%��̬��ʾ����
for k=1:N
n=1:2:n_max(k); %ÿ�����г��������Ӧ�� г��������
%����Ҷչ��ʽ
b=4./(pi*n);    
x=b*sin(omega*n'*(t+pi/2));
%��ͼ
%�������飬�˴�ɾȥ�˵����˵��� ���û��洰�� Figure ��������������ĵ�һ����
%��ɾȥ��ͼ��Ҳ�Ƕ�̬�ģ��������Ƕ���������ԸĸĿ�һ����ɾȥ�Ժ�Ͳ���򿪺ܶര���ˣ�ͼ����һ������������ʾ
plot(t,y);
hold on;      %������� hold off��ͬ���ã��� x �� y ��ͼ����ʾ��һ����������
plot(t,x);
hold off;
xlabel('t'),ylabel('�ϳɺ�Ĳ���')     %����ֱ��� x �� y �������
axis([-pi pi -1.5 1.5])                % ����������ķ�ΧX�᣺-pi~pi  Y�� �� -1.5~1.5
grid on    % grid on ��������ʹ������
title(['г����=',num2str(n_max(k))])   % ͼ�α���

set(gcf,'DoubleBuffer','on'); 
% set�������'������','����ֵ')��һ�������� ����� MATLAB ���Զ��еģ��൱��C���Ե�ָ��
% DoubleBuffer ��ʹ��˫���壬�ڼ�����һ��ͼ��ͬʱ����ʾ��һ�Ż��ƺõ�ͼ������ͼ���л��������˸��
drawnow;
end
%��ȡ4����ʾ%
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
xlabel('t'),ylabel('�ϳɺ�Ĳ���')
axis([-pi pi -1.5 1.5])
grid on
title(['г����=',num2str(n_max(k))])
end


