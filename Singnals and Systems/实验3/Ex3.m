clc;
clear;

%% 点运算
a =0.3; b =50; c =2; gamma =1.5;

r = imread('Scarlett.jpg'); %读取图片到矩阵  
r = im2double(r);           %将图片转换为 double型
r = rgb2gray(r);            %将彩色矩阵转换为灰度矩阵

F = fft2(r);
F = abs(fftshift(F));
r = imadjust(r,[0.1 0.7],[0 1]);  %调整灰度范围


s1 = a*r+b/255;             %线性变换点运算
s2 = c*log(r+1);            %对数变换点运算
T = log(F+1);
s3 = a*(r.^gamma);          %伽马变换点运算


figure(1) % 显示运算后的图形
subplot(2,2,1);imshow(r);title('原始图像')
subplot(2,2,2);imshow(s1);title('线性变换')       
subplot(2,2,3);imshow(s2);title('对数变换')
subplot(2,2,4);imshow(s3);title('伽马变换')
suptitle('1603643050 + 张焱兵：点运算');

figure(2)

subplot(1,2,1);
imshow(F,[]);
title('未变换的频谱');
subplot(1,2,2);
imshow(T,[]);
title('对数变换后的频谱')
suptitle('1603643050 + 张焱兵：对数变换频谱变化');
%% 缩放

img1 = imresize(r,1.5);        %图像比例放大1.5倍
img2 = imresize(r,0.7);        %比例缩小0.7倍
img3 = imresize(r,[600 700]);  %非比例放大到600×700像素
img4 = imresize(r,[300 400]);  %非比例缩小到300×400像素

figure(3)  % 显示缩放后的图形
a1 =subplot(2,2,1);imshow(img1);title('x1.5')    
a2 =subplot(2,2,2);imshow(img2);title('x0.7')    
a3 =subplot(2,2,3);imshow(img3);title('600*700') 
a4 =subplot(2,2,4);imshow(img4);title('300*400')

%让图像按比例显示
xsize =get(a1,'XLim');
ysize =get(a1,'YLim');
set(a2,'XLim',xsize,'YLim',ysize);
set(a3,'XLim',xsize,'YLim',ysize);
set(a4,'XLim',xsize,'YLim',ysize);
suptitle('1603643050 + 张焱兵：缩放');
