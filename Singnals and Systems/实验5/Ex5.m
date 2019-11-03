clear,clc,close all

img1=imread('figure51.jpg');
img1 = im2double(img1);  %double类型转换

figure(1)
subplot(1,3,1),imshow(img1);
title('原始图像');

lim = stretchlim(img1);   %灰度变换自适应阈值
L =imadjust(img1,lim,[]); % 增强图像的对比度
subplot(1,2,2),imshow(L);
title('最佳范围调整');
suptitle('1603643050 张焱兵：灰度变换')

%% 图像边缘提取
img2=imread('lenagray.jpg');

figure(2)
subplot(2,2,1),imshow(img2);title('原图');
% 使用sobel算子
img_edge = SobelOperator(img2);
subplot(2,2,2);imshow(img_edge,[]);title('sobel提取边缘');

% 使用prewitt算子
img_edge = PrewittOperator(img2);
subplot(2,2,3);imshow(img_edge,[]);title('prewitt算子提取边缘');

% 使用roberts算子
subplot(2,2,4);
img_edge = RobertsOperator(img2);
imshow(img_edge);title('Roberts 算子提取边缘');

suptitle('1603643050 张焱兵：提取图像边缘')



