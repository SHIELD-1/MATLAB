clc;
clear;

%% ������
a =0.3; b =50; c =2; gamma =1.5;

r = imread('Scarlett.jpg'); %��ȡͼƬ������  
r = im2double(r);           %��ͼƬת��Ϊ double��
r = rgb2gray(r);            %����ɫ����ת��Ϊ�ҶȾ���

F = fft2(r);
F = abs(fftshift(F));
r = imadjust(r,[0.1 0.7],[0 1]);  %�����Ҷȷ�Χ


s1 = a*r+b/255;             %���Ա任������
s2 = c*log(r+1);            %�����任������
T = log(F+1);
s3 = a*(r.^gamma);          %٤��任������


figure(1) % ��ʾ������ͼ��
subplot(2,2,1);imshow(r);title('ԭʼͼ��')
subplot(2,2,2);imshow(s1);title('���Ա任')       
subplot(2,2,3);imshow(s2);title('�����任')
subplot(2,2,4);imshow(s3);title('٤��任')
suptitle('1603643050 + ���ͱ���������');

figure(2)

subplot(1,2,1);
imshow(F,[]);
title('δ�任��Ƶ��');
subplot(1,2,2);
imshow(T,[]);
title('�����任���Ƶ��')
suptitle('1603643050 + ���ͱ��������任Ƶ�ױ仯');
%% ����

img1 = imresize(r,1.5);        %ͼ������Ŵ�1.5��
img2 = imresize(r,0.7);        %������С0.7��
img3 = imresize(r,[600 700]);  %�Ǳ����Ŵ�600��700����
img4 = imresize(r,[300 400]);  %�Ǳ�����С��300��400����

figure(3)  % ��ʾ���ź��ͼ��
a1 =subplot(2,2,1);imshow(img1);title('x1.5')    
a2 =subplot(2,2,2);imshow(img2);title('x0.7')    
a3 =subplot(2,2,3);imshow(img3);title('600*700') 
a4 =subplot(2,2,4);imshow(img4);title('300*400')

%��ͼ�񰴱�����ʾ
xsize =get(a1,'XLim');
ysize =get(a1,'YLim');
set(a2,'XLim',xsize,'YLim',ysize);
set(a3,'XLim',xsize,'YLim',ysize);
set(a4,'XLim',xsize,'YLim',ysize);
suptitle('1603643050 + ���ͱ�������');
